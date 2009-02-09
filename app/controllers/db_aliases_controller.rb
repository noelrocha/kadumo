class DbAliasesController < ApplicationController

  active_scaffold :db_aliases do |config|
    config.label = "DB Aliases"
    
    config.columns = [:username, :domain, :alias_username, :alias_domain]
    config.columns[:domain].form_ui = :select
            
    config.list.sorting = [{:domain => 'ASC'}, {:username => 'ASC'}]
  end

end
