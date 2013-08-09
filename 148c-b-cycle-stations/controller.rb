require '../dvc-sinatra.rb'

get "/" do
  @stations = Station.order(:station_name).page(params[:page]).all
  halt erb(:index)
end

get "/planned" do
  @stations = Station.order(:station_name).where(status: "planned").page(params[:page]).all
  halt erb(:index)
end

get "/existing" do
  @stations = Station.order(:station_name).where(status: "existing").page(params[:page]).all
  halt erb(:index)
end

get "/zip/80205" do
  @stations = Station.order(:station_name).where(zip_code: "80205").page(params[:page]).all
  halt erb(:index)
end

get "/zip/80209" do
  @stations = Station.order(:station_name).where(zip_code: params[:zip_code]).page(params[:page]).all
  halt erb(:index)
end