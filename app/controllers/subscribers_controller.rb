class SubscribersController < ApplicationController

  active_scaffold :subscriber do |config|
    config.label = "Subscribers"
    config.columns = [:username, :password, :first_name, :last_name, :email_address, :aliases]

    config.list.columns = [:username, :domain, :first_name, :last_name, :email_address] 
    config.columns[:domain].form_ui = :select

    config.create.columns.add_subgroup "Personal" do |name_group|
      name_group.add :first_name, :last_name, :email_address
    end    
      
  end

end
