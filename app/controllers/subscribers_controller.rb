class SubscribersController < ApplicationController

  active_scaffold :subscriber do |config|
    config.label = "Subscribers"
    config.columns = [:username, :password, :domain, :first_name, :last_name, :email]
    config.list.columns = [:username, :domain, :first_name, :last_name, :email]
#    config.columns[:domain].form_ui = :select

#    config.nested.add_link "Aliases", [:aliases]
    config.list.sorting = {:username => 'ASC'} 
  end

end
