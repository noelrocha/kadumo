class SubscribersController < ApplicationController

  active_scaffold :subscriber do |config|
    config.label = "Subscribers"
    config.columns = [:username, :password, :domain, :first_name, :last_name, :email_address]
    config.list.columns = [:username, :domain, :first_name, :last_name, :email_address]
    config.columns[:domain].form_ui = :select
    domains = Hash.new { |h,k| h[k] = [] }
    Domain.find(:all).each { |domain| domains[domain.name] <<  domain.name }
    config.columns[:domain].options = domains

#    config.nested.add_link "Aliases", [:aliases]
    config.list.sorting = {:username => 'ASC'} 
  end

end
