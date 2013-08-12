require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do 
  @username = params[:username]
  halt erb(:login)
end

post "/login" do
  @username = params[:username]

  member = Member.find(1)
  if @username == member.username
    redirect "/reservations/1"
  else
    if true # for ted
      redirect "/reservations/2"
    else # not ted
      halt erb(:login)
    end
  end

end

get "/reservations/1" do
  halt erb(:reservations)
end
