class DbAliasesController < ApplicationController

  active_scaffold :db_alias do |config|
    config.label = "DB Aliases"
    
    config.columns = [:alias_username, :alias_domain, :username, :domain]
    config.columns[:domain].form_ui = :select
            
    config.list.sorting = [{:domain => 'ASC'}, {:username => 'ASC'}]
  end

end
