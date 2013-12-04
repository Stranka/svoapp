class BasketlinesController < ApplicationController
  # GET /basketlines
  # GET /basketlines.xml
  def index
#    @basketlines = Basketline.all
    @basketlines = Basketline.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @basketlines }
    end
  end

  # GET /basketlines/1
  # GET /basketlines/1.xml
  def show
    @basketline = Basketline.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @basketline 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @basketline }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /basketlines/new
  # GET /basketlines/new.xml
  def new
    if @auth_edit >= 50    
      @basketline = Basketline.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @basketline }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /basketlines/1/edit
  def edit
    @basketline = Basketline.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @basketline 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /basketlines
  # POST /basketlines.xml
  def create
    @basketline = Basketline.new(params[:basketline])

    respond_to do |format|
      if @basketline.save
        format.html { redirect_to(@basketline, :notice => Basketline.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @basketline, :status => :created, :location => @basketline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @basketline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /basketlines/1
  # PUT /basketlines/1.xml
  def update
    @basketline = Basketline.find(params[:id])

    respond_to do |format|
      if @basketline.update_attributes(params[:basketline])
        format.html { redirect_to(@basketline, :notice => Basketline.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @basketline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /basketlines/1
  # DELETE /basketlines/1.xml
  def destroy   
    @basketline = Basketline.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @basketline
      @basketline.destroy

      respond_to do |format|
        format.html { redirect_to(basketlines_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end
