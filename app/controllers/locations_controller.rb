class LocationsController < ApplicationController

  active_scaffold :location do |config|
    config.label = "Registered Users"
    config.list.columns = [:username, :domain, :contact, :received, :expires, :user_agent]
    config.list.sorting = [{:username => 'ASC'}, {:expires => 'ASC'}]
    config.actions = [:list, :show, :search, :delete]    
  end
  
end
