require '../dvc-sinatra.rb'

get "/" do
  @cities = WorldCity.all
  halt erb(:index)
end

get "/cities/:id" do
  @city = WorldCity.find(params[:id])
  halt erb(:show)
end
