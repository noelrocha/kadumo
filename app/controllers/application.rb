class ApplicationController < ActionController::Base

  helper :all
  filter_parameter_logging :password
  layout "default"
  protect_from_forgery 
    
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end  
  
end
