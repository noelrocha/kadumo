class DomainsController < ApplicationController

  active_scaffold :domain do |config|
    config.label = "Domains"
    config.columns = [:name]
    list.sorting = {:name => 'ASC'}
  end
  
end
