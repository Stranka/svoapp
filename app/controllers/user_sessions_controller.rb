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

   def create
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = t('Login successful!')
        check_basket
#        redirect_back_or_default users_url
        redirect_to(home_path)
      else
        render :action => :new
      end
    end

    def destroy
      current_user_session.destroy
      flash[:notice] = t('Logout successful!')
#      redirect_back_or_default new_user_session_url
      redirect_to(home_path)
    end

protected

  def check_basket
    @basket = Basket.find_by_session_id(request.session_options[:id])
    @customer = Customer.find(:first, :conditions => ['login = ?', params[:user_session][:login]])
    if @basket
      @basket.customer_id = @customer.id
      @basket.save
    else
      @basket = Basket.find(:first, :conditions => ['customer_id = ? and status = ?', @customer.id, 'offen'])
      if @basket
        @basket.session_id = request.session_options[:id]
        @basket.save
      end
    end
  end
end

