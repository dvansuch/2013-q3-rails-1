require '../dvc-sinatra.rb'

get "/" do
  halt erb(:root)
end

post "/" do
	new_email 		  = Email.new
	new_email.subject = params[:subject]
	new_email.body	  = params[:body]
	new_email.save!
	redirect "/"
end