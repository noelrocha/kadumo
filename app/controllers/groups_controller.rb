class GroupsController < ApplicationController

  active_scaffold :group do |config|
    config.label = "Groups"
    
    config.columns = [:username, :domain, :grp]
    config.columns[:domain].form_ui = :select
    config.columns[:grp].label = "Group"
            
    config.list.sorting = [{:domain => 'ASC'}, {:username => 'ASC'}]
  end

end
