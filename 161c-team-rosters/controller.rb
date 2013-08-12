require '../dvc-sinatra.rb'

get "/" do
	@team = Team.all 
	halt erb(:index)
end

get "/team/:color" do
	@color = Team.where(color: params[:color])
	@member = Member.all
	halt erb(:team)
end
