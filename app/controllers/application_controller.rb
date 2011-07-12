# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base


  protect_from_forgery

  before_filter :get_config
  before_filter :get_blocks
  before_filter :require_user, :except => [:articles,:showme,:show_content,:permalink,:search_all,
                                           :products,:show_products_productclass,
                                           :baskets,:add_to_basket,:show_my_open_order,:checkout,
                                           :productclasses,:click,
                                           :menues,:click,
                                           :customers,:new,:create,
                                           :user_sessions, :new]

  helper_method :current_user_session, :current_user


  def get_config
    @config = Configuration.find(:first)
    @ebene_productclass = -1
    @ebene_menue = -1
    @config.theme.nil? ? @config.theme = "gray" : true
    @stylesheet = @config.theme + '/nuke.css'
    @imagepath = '/stylesheets/' + @config.theme + '/images/'
    @logo = @imagepath + 'logo.png'
    @plus = @imagepath +  'plus.png'
    @minus = @imagepath + 'minus.png'
    @dot = @imagepath + 'dot.png'
    @up = @imagepath + 'up.png'
    @down = @imagepath + 'down.png'
    @picture_size = 2048000
    @CO = ['', 'articles', 'baskets', 'blocks', 'configurations', 'menues', 'news', 'pictures', 'productclasses', 'products', 'shipments','users']
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
      @firstarticle.name = t('not found')
      @firstarticle.content = t("can't find the first article, please check the configuration")
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

    # get all actions for specified controller
    def get_all_actions(cont)
      c= Module.const_get(cont.to_s.pluralize.capitalize + "Controller")
      c.public_instance_methods(false).reject{ |action| ['rescue_action'].include?(action) }
    end

end

