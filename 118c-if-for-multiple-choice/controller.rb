require '../dvc-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/example1" do
  halt erb(:example)
end

get "/example2" do
  @gender = "female"
  @color = "blue"
  @donor = false
  halt erb(:example)
end

get "/example3" do
  @gender = "male"
  @color = "green"
  @donor = true
  halt erb(:example)
end
