require '../dvc-sinatra.rb'

get "/" do
	halt erb(:index)
end

get "/team/:color" do
	
end
