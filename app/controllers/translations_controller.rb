class TranslationsController < ApplicationController
  # GET /translations
  # GET /translations.xml
  def index
#    @translations = Translation.all
    @translations = Translation.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @translations }
    end
  end

  # GET /translations/1
  # GET /translations/1.xml
  def show
    @translation = Translation.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @translation 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @translation }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /translations/new
  # GET /translations/new.xml
  def new
    if @auth_edit >= 50    
      @translation = Translation.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @translation }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /translations/1/edit
  def edit
    @translation = Translation.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @translation 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /translations
  # POST /translations.xml
  def create
    @translation = Translation.new(params[:translation])

    respond_to do |format|
      if @translation.save
        format.html { redirect_to(@translation, :notice => Translation.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @translation, :status => :created, :location => @translation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /translations/1
  # PUT /translations/1.xml
  def update
    @translation = Translation.find(params[:id])

    respond_to do |format|
      if @translation.update_attributes(params[:translation])
        format.html { redirect_to(@translation, :notice => Translation.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @translation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.xml
  def destroy   
    @translation = Translation.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @translation
      @translation.destroy

      respond_to do |format|
        format.html { redirect_to(translations_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end
