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
	color = params[:color]
	@color = Team.where(color: color).first
	@members = Member.where(team_id: @color.id).all
	halt erb(:team)
end

post "/team/:color" do
	color = params[:color]
	name = params[:new_team_member]


	team = Team.where(color: color).first

	member = Member.new
	member.team_id = team.id
	member.name = name
	member.save! 

	redirect "/team/#{color}"
end