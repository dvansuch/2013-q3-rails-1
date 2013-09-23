App::Application.routes.draw do
  get  "/"               	=> "ads#root"

  get  "/ads"       			=> "ads#ads"

  get  "/ads/new"         => "ads#new"
  post "/ads/new"         => "ads#new_post"

  get  "/ads/:id"    			=> "ads#show"

  get  "/ads/:id/edit"    	=> "ads#edit"
  put "/ads/:id/edit"    	=> "ads#edit_post"

  delete  "/ads/:id" 	=> "ads#destroy"
end
