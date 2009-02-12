class UsersController < ApplicationController

  active_scaffold :user do |config|
    config.label = "Web Users"
    config.columns = [:login, :name, :email, :password, :password_confirmation]
    config.list.columns = [:login, :name, :email]
    
    config.columns[:password].form_ui = :password
    config.columns[:password_confirmation].form_ui = :password    
  end
  
  # # render new.rhtml
  # def new
  #   @user = User.new
  # end
  #  
  # def create
  #   logout_keeping_session!
  #   @user = User.new(params[:user])
  #   success = @user && @user.save
  #   if success && @user.errors.empty?
  #           # Protects against session fixation attacks, causes request forgery
  #     # protection if visitor resubmits an earlier form using back
  #     # button. Uncomment if you understand the tradeoffs.
  #     # reset session
  #     self.current_user = @user # !! now logged in
  #     redirect_back_or_default('/')
  #     flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
  #   else
  #     flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
  #     render :action => 'new'
  #   end
  # end
end
