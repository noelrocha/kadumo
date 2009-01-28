ActionController::Routing::Routes.draw do |map|
  map.resources :aliases

  map.resources :subscribers

  map.resources :domains

  map.root :controller => "subscribers"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
