class DomainsController < ApplicationController

  active_scaffold :domain do |config|
    config.label = "Domains"
    config.columns = [:domain]
    config.list.sorting = {:domain => 'ASC'}
  end
  
end
