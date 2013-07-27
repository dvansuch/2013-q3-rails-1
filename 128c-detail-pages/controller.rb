require '../dvc-sinatra.rb'

get "/" do
  @apartments = Apartment.all
  halt erb(:index)
end

get "/apartments/:x" do
  @apartment = Apartment.find(params[:x])
  halt erb(:show)
end
