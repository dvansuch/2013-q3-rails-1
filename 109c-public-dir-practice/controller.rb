require 'sinatra'

get "/1" do
	halt erb(:page1)
end

get "/2" do
	halt erb(:page2)
end