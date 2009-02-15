class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  audit Subscriber, DbAlias, Domain, Gateway, Route, Trusted, User, :only => [:create, :update, :destroy]
  before_filter :login_required
  helper :all
  filter_parameter_logging :password
  layout "default"
  protect_from_forgery 
    
  ActiveScaffold.set_defaults do |config| 
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
  end  
end
