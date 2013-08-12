require '../dvc-sinatra.rb'

get "/" do
  @people = Person.order(:id).all
  halt erb(:index)
end

post "/" do
  [1, 2, 3].each do |num|
    if params["new_name_#{num}"] != ""
      new_person = Person.new
      new_person.name = params["new_name_#{num}"]
      new_person.save!
    end
  end
  redirect "/"
end