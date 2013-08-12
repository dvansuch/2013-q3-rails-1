require '../dvc-sinatra.rb'

get "/" do
	@team = Team.all 
	halt erb(:index)
end

post "/" do
	@team = Team.all
	@color = Team.where(color: params[:color])

	@new_team = params[:new_team_color]
	if @new_team != ""
		color = Team.new
		color.color = params[:new_team_color]
		color.save
		redirect "/"
	else
		@error = "Please enter a new color"
		halt erb(:index)
	end
end

get "/team/:color" do
	@color = Team.where(color: params[:color])
	@member = Member.all
	halt erb(:team)
end

