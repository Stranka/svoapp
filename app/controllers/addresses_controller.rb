class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.xml
  def index
#    @addresses = Address.all
    @addresses = Address.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    @address = Address.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @address 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @address }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    if @auth_edit >= 50    
      @address = Address.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @address }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @address 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
        format.html { redirect_to(@address, :notice => t('Address was successfully created.')) }
        format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to(@address, :notice => t('Address was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy   
    @address = Address.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @address
      @address.destroy

      respond_to do |format|
        format.html { redirect_to(addresses_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end
