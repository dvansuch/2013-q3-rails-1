require '../dvc-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
	@members = Member.all 
  halt erb(:login)
end

post "/login" do
	ent_username = params[:username]
	ent_password = params[:password]

	member = Member.where(username: ent_username).first
	if member == nil
		@error = "Error: Unknown username"
		halt erb(:login)
	elsif ent_username == member.username
		if ent_password == member.password
			redirect "/reservations/#{member.id}"
		else ent_password != member.password
			@error = "Error: Unknown password"
			halt erb(:login)
		end
	end
end

get "/reservations/:id" do
	member_id = params[:id]
	member = Member.where(username: member_id).first	
	car = Car.all
  halt erb(:reservations)
end

post "/reservations/:id" do
	if params[:commit] == "Logout"
		redirect "/login"
	end

	Car.all.each do |car|
	    if params[:commit] == "Return car #{car.id}"
	      car.reserving_member_id = nil
	      car.save!
	    end
	  end

	  Car.all.each do |car|
	    if params[:commit] == "Reserve car #{car.id}"
	      car.reserving_member_id = member_id
	      car.save!
	    end
	  end

	  redirect "/reservations/#{member_id}"
end
