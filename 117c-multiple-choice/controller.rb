require '../dvc-sinatra.rb'

get "/example1" do
  halt erb(:example1)
end

get "/example2" do
  halt erb(:example2)
end

get "/example3" do
  halt erb(:example3)
end

