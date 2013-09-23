App::Application.routes.draw do
  resources :books

  get "/" => "books#root"

end
