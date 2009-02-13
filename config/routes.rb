ActionController::Routing::Routes.draw do |map|
  map.resources :missed_calls

  map.resources :accs

  map.resources :cdrs

  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :users, :active_scaffold => true

  map.resource :session

  map.resources :imported_files

  map.resources :dialogs, :active_scaffold => true

  map.resources :locations, :active_scaffold => true

  map.resources :trusteds, :active_scaffold => true

  map.resources :routes, :active_scaffold => true

  map.resources :gateways, :active_scaffold => true

  map.resources :db_aliases, :active_scaffold => true

  map.resources :subscribers, :active_scaffold => true

  map.resources :domains, :active_scaffold => true
  
  map.root :controller => "subscribers"

  map.namespace "admin" do |admin|
      admin.resources :jobs
  end
    
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
