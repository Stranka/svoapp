class UserSessionsController < ApplicationController
   
#   before_filter :require_no_user, :only => [:new, :create]
   before_filter :require_no_user, :only => [:create]   
   before_filter :require_user, :only => :destroy
  
   def new
     if current_user
       current_user_session.destroy
     end
     @user_session = UserSession.new
   end
  dfsdfsdfsdfsdfsdfsdfsdf
   def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Login successful!"
#        redirect_back_or_default users_url
        redirect_to(home_path)
      else
        render :action => :new
      end
    end
   
    def destroy
      current_user_session.destroy
      flash[:notice] = "Logout successful!"
#      redirect_back_or_default new_user_session_url
      redirect_to(home_path)
    end
end
