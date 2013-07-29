require '../dvc-sinatra.rb'

get "/" do
  @patients = Patient.all
  halt erb(:index)
end

get "/:edit_id" do
  @patient = Patient.find(params[:edit_id])
  halt erb(:edit)
end

