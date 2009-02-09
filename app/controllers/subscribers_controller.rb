class SubscribersController < ApplicationController

  active_scaffold :subscriber do |config|
    config.label = "Subscribers"
    config.columns = [:username, :password, :domain, :first_name, :last_name, :email_address]

    config.list.columns = [:username, :domain, :first_name, :last_name, :email_address] 
    config.columns[:domain].form_ui = :select

    config.create.columns.add_subgroup "Personal Information" do |name_group|
      name_group.add :first_name, :last_name, :email_address
    end    
      
    config.columns[:domain].sort_by :sql
  end

end
