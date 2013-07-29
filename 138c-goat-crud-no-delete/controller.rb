require '../dvc-sinatra.rb'

get "/" do
	@goats = RacingGoat.all
	halt erb(:index)
end
