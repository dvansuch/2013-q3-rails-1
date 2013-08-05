require '../dvc-sinatra.rb'

get "/" do
  @persons = Person.all
  halt erb(:index)
end

post "/" do
  @person = Person.new
  @person.relation_to_filer = params[:relation_to_filer]
  @person.first_name 		= params[:first_name]
  @person.last_name			= params[:last_name]
  @person.date_of_birth		= params[:date_of_birth]
  @person.gender			= params[:gender]
  @person.is_dependent		= params[:is_dependent] == "on"
  @person.save!
  redirect "/"
end
