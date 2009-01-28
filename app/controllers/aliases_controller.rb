class AliasesController < ApplicationController
  
  active_scaffold :alias do |config|
    config.label = "Aliases"
    config.columns = [:alias_username, :alias_domain]
    #config.columns[:subscriber].form_ui = :select
    
    # config.create.columns.add_subgroup "Owner" do |name_group|
    #   name_group.add :username, :domain
    # end
        
    # config.list.sorting = [{:domain => 'ASC'}, {:username => 'ASC'}]
  end
  
end
