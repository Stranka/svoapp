# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  

  protect_from_forgery
  
  before_filter :get_config
  before_filter :get_blocks
  before_filter :require_user, :except => [:articles,:showme,:show_content,:permalink,
                                           :products,:show_products_productclass,
                                           :productclasses,:click,
                                           :menues,:click,
                                           :customers,:new,:create,
                                           :user_sessions, :new]

  helper_method :current_user_session, :current_user  
  
  
  def get_config
    @config = Configuration.find(:first)
    @ebene_productclass = -1
    @ebene_menue = -1
  end
  
  def get_blocks
    if current_user == nil
      @auth_show = 0
      @auth_edit = 0
    else
      @auth_show = current_user.auth_level
      @auth_edit = current_user.auth_level_edit
    end
    
    @lblocks = Block.find(:all, :conditions => ['position = ? and active = ? and auth_level <= ? ', 'links', true, @auth_show], :order => "fieldorder")
    @rblocks = Block.find(:all, :conditions => ['position = ? and active = ? and auth_level <= ?', 'rechts', true, @auth_show], :order => "fieldorder")
    @menue_top = Menue.find(:all, :conditions => ['ontop = ? and active = ? and auth_level <= ?', true, true, @auth_show], :order => 'position')

    @firstarticle = Article.find(:first, :conditions => {:id => @config.articles_name})
    if @firstarticle == nil
      @firstarticle = Article.new
      @firstarticle.name = "Nicht gefunden"
      @firstarticle.content = "Ihr Startartikel wurde nicht gefunden, bitte prüfen sie die Konfiguration"
    end
    
    @user_session = UserSession.new
  end
 
#  private
    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      logger.debug "ApplicationController::current_user"
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end
