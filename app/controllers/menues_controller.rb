class MenuesController < ApplicationController
  # GET /menues
  # GET /menues.xml
  def index
    @menues = Menue.where("auth_level <= ?", @auth_show).order("parent_id", "position")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menues }
    end
  end

  # GET /menues/1
  # GET /menues/1.xml
  def show
    @menue = Menue.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @menue
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @menue }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /menues/new
  # GET /menues/new.xml
  def new
    if @auth_edit >= 50
      @articles = Article.all
      @menue = Menue.new
      @men = Menue.all

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @menue }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /menues/1/edit
  def edit
    @articles = Article.all
    @men = Menue.all
    @menue = Menue.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @menue
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # POST /menues
  # POST /menues.xml
  def create
    @menue = Menue.new(params[:menue])

    if @menue.parent_id == nil or @menue.parent_id == ''
      @menue.parent_id = 0
    end
    respond_to do |format|
      if @menue.save
        format.html { redirect_to(@menue, :notice => Menue.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @menue, :status => :created, :location => @menue }
      else
        @articles = Article.all
        @men = Menue.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @menue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menues/1
  # PUT /menues/1.xml
  def update
    @menue = Menue.find(params[:id])

    if params[:menue][:parent_id] == '' or params[:menue][:parent_id] == nil
      params[:menue][:parent_id] = 0
    end
    respond_to do |format|
      if @menue.update_attributes(params[:menue])
        format.html { redirect_to(@menue, :notice => Menue.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        @articles = Article.all
        @men = Menue.all
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menues/1
  # DELETE /menues/1.xml
  def destroy
    @menue = Menue.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @menue
      @menue.destroy

      respond_to do |format|
        format.html { redirect_to(menues_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  def click
    @tree = Tree.find(:first, :conditions => ['session_id = ? and model = ? and model_id = ?', request.session_options[:id], 'menue', params[:id]])
#    @menue = Menue.find(params[:id])
    if @tree == nil
      @tree = Tree.new
      @tree.session_id = request.session_options[:id]
      @tree.model = 'menue'
      @tree.model_id = params[:id]
      @tree.ancestry = 'close'
    else
      if @tree.ancestry == 'close'
        @tree.ancestry = 'open'
      else
        @tree.ancestry = 'close'
      end
    end
    @tree.save
    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])
  end

  def up
    @menue = Menue.find(params[:id])
    @menue.move_higher

    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])

  end

  def down
    @menue = Menue.find(params[:id])
    @menue.move_lower

    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])
  end

  def change_language
    I18n.locale = params[:language]
    redirect_to root_path
  end

  def change_theme
    # HAS: 20120508: Farbe fixiert
    # RailsNuke::Application.config.theme = params[:theme]
    RailsNuke::Application.config.theme = "soft-red"
    redirect_to root_path
  end

end

