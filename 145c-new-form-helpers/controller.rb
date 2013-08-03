require '../dvc-sinatra.rb'

get "/" do
  @occupations = Occupation.all
  halt erb(:root)
end

post "/:id" do
  @user = Occupations.find(params[:id])
end
