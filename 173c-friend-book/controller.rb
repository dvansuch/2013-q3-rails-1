require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
	@username = params[:name]
	@password = params[:password]
	person = Person.where(name: @username).first

	if @username == ""
		@error = "Please choose a username"
		halt erb(:login)
	elsif person.authenticate(@password) == false
		@error = "Incorrect password"
		halt erb(:login)
	else
		session[:person_id] = person.id
		redirect "/followers"
	end
end

get "/followers" do
	@person = Person.find(session[:person_id])
  halt erb(:followers)
end

post "/followers" do
	@person = Person.find(session[:person_id])

	if params[:commit] == "Follow"
		name = params[:new_following]
		@following = Person.where(name: name).first

		new_following = Following.new
		new_following.to_person_id = @person.id
		new_following.from_person_id = @following.id
		new_following.save!
	end
	redirect "/followers"
end

get "/logout" do
  session.clear
  redirect "/"
end
