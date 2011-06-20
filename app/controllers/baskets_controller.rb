class BasketsController < ApplicationController
  # GET /baskets
  # GET /baskets.xml
  def index
#    @baskets = Basket.all
    @baskets = Basket.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @baskets }
    end
  end

  # GET /baskets/1
  # GET /baskets/1.xml
  def show
    @basket = Basket.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @basket 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @basket }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /baskets/new
  # GET /baskets/new.xml
  def new
    if @auth_edit >= 50    
      @basket = Basket.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @basket }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /baskets/1/edit
  def edit
    @basket = Basket.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @basket 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /baskets
  # POST /baskets.xml
  def create
    @basket = Basket.new(params[:basket])

    respond_to do |format|
      if @basket.save
        format.html { redirect_to(@basket, :notice => Basket.human_name + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @basket, :status => :created, :location => @basket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @basket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /baskets/1
  # PUT /baskets/1.xml
  def update
    @basket = Basket.find(params[:id])

    respond_to do |format|
      if @basket.update_attributes(params[:basket])
        format.html { redirect_to(@basket, :notice => Basket.human_name + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @basket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.xml
  def destroy   
    @basket = Basket.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @basket
      @basket.destroy

      respond_to do |format|
        format.html { redirect_to(baskets_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end
