class DialogsController < ApplicationController

  active_scaffold :dialog do |config|
    config.label = "Active Calls"
    config.list.columns = [:start_time, :from_uri, :to_uri, :caller_contact, :callee_contact]
    list.sorting = {:start_time => 'ASC'}
    config.actions = [:list, :show, :search, :delete]    
  end

end
