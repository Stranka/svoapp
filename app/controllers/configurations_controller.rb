class ConfigurationsController < ApplicationController
  # GET /configurations
  # GET /configurations.xml
  
  before_filter :check_authlevel
  
  
  def index
    @configurations = ActiveRecord::Base::Configuration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @configurations }
    end
  end

  # GET /configurations/1
  # GET /configurations/1.xml
  def show
    @configuration = ActiveRecord::Base::Configuration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @configuration }
    end
  end

  # GET /configurations/1/edit
  def edit
    @configuration = ActiveRecord::Base::Configuration.find(params[:id])
    @articles = Article.find(:all)
  end

  # PUT /configurations/1
  # PUT /configurations/1.xml
  def update
    @configuration = ActiveRecord::Base::Configuration.find(params[:id])

    respond_to do |format|
      if @configuration.update_attributes(params[:configuration])
        format.html { redirect_to(@configuration, :notice => ActiveRecord::Base::Configuration.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @configuration.errors, :status => :unprocessable_entity }
      end
    end
  end
  
private
  def check_authlevel
    if @auth_edit < 100
      flash[:notice] = t('access denied')
      redirect_to root_path
      return false      
    end
  end  
end
