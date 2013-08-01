require '../dvc-sinatra.rb'

get "/" do
  @bracelet_lines = BraceletLine.order("id").all
  halt erb(:root)
end

get "/line1" do
  @bracelet_line = BraceletLine.find(1)
  halt erb(:edit)
end

post "/line1" do
	bracelet_line 			= BraceletLine.find(1)
	bracelet_line.font_size = params[:font_size]
	bracelet_line.text 		= params[:text]
	bracelet_line.save!
	redirect "/"
end

get "/line2" do
  @bracelet_line = BraceletLine.find(2)
  halt erb(:edit)
end


post "/line2" do
	bracelet_line 			= BraceletLine.find(2)
	bracelet_line.font_size = params[:font_size]
	bracelet_line.text 		= params[:text]
	bracelet_line.save!
	redirect "/"
end
