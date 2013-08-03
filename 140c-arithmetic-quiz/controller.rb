require '../dvc-sinatra.rb'

get "/" do
  redirect "/1"
end

get "/1" do
  @page = "1"
  @question = "What is 8+5?"
  @answer1 = "14"
  @answer2 = "40"
  @answer3 = "13"
  halt erb(:question1)
end

post "/1" do
  if params[:answer] == "three"
    redirect "/2"
  else
    redirect "/1"
  end
end

get "/2" do
  @page = "2"
  @question = "What is 5-3?"
  @answer1 = "2"
  @answer2 = "3"
  @answer3 = "8"
  halt erb(:question1)
end

post "/2" do
  if params[:answer] == "one"
    redirect "/done"
  else
    redirect "/2"
  end
end

get "/done" do
  halt erb(:done)
end
