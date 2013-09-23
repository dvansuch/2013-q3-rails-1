App::Application.routes.draw do
  get "/" => redirect("/users")

  resources :users, only: ["index", "new", "create"]
  post "/users/login"  => "users#login",  as: "login"
  post "/users/logout" => "users#logout", as: "logout"

  get "/verify_email/:user_id/:token" => "users#verify_email", as: "verify_email"

  post "/send_email" => "users#send_email", as: "send_email"
  

end
