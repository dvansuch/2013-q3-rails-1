require '../dvc-sinatra.rb'

get "/"  do
  redirect "/login"
end

get "/login"  do
  halt erb(:login)
end

post "/login" do
  found_user = User.where(username: params[:username]).first

  if found_user && params[:password] == found_user.password
    session[:user_id] = found_user.id
    redirect "/accounts"
  else
    @error = "Incorrect username or password"
    halt erb(:login)
  end
end

get "/accounts" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:accounts)
end

get "/location" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:location)
end

get "/rates" do
  @user = User.where(id: session[:user_id]).first
  halt erb(:rates)
end

get "/logout" do
  session.clear
  redirect "/login"
end

get "/accounts/:type" do 
  type = params[:type]
  @account = Account.where(account_type: type).first
  @user = User.where(id: session[:user_id]).first
  halt erb(:transactions)
end

post "/accounts/:type" do 
  type = params[:type]
  @account = Account.where(account_type: type).first
  @user = User.where(id: session[:user_id]).first
  current_balance = 0.0

  @account.transactions.each do |transaction|
    transaction.date = params["date#{transaction.id}"]
    transaction.memo = params["memo#{transaction.id}"]
    transaction.amount = params["amount#{transaction.id}"]
    transaction.save!
    
    current_balance = current_balance + transaction.amount

    if params[:commit] == "Delete transaction #{transaction.id}"
      transaction.destroy
      current_balance = current_balance - transaction.amount
    end
  end

  if params[:new_date && :new_memo && :new_amount] != "" 
    new_transaction = Transaction.new
    new_transaction.date = params[:new_date]
    new_transaction.memo = params[:new_memo]
    new_transaction.amount = params[:new_amount]
    new_transaction.account_id = @account.id
    new_transaction.save!

    current_balance = current_balance + transaction.amount
  end

  @account.current_balance = current_balance
  @account.save!

  redirect "/accounts/#{type}"
end
