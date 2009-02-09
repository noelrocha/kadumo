ActionController::Routing::Routes.draw do |map|
  map.root :controller => "subscribers"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
