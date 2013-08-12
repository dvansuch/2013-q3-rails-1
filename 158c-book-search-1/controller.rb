require '../dvc-sinatra.rb'

get "/" do
  halt erb(:browse)
end

get "/year/:year" do
	@books = Book.where(publication_year: params[:year]).all
	@header = "Books published in #{params[:year]}"
  halt erb(:index)
end

get "/topic/:topic" do
	@books = Book.where("title ilike ?", "%#{params[:topic]}%").all
	@header = "Books with keyword #{params[:topic]}"
	halt erb(:index)
end

get "/author/:author" do
	@books = Book.where(author: params[:author])
	@header = "Books published by #{params[:author]}"
  halt erb(:index)
end


# TODO: Write author route

# TODO: Write topic route
