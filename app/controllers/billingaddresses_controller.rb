class BillingaddressesController < ApplicationController
  # GET /billingaddresses
  # GET /billingaddresses.xml
  def index
#    @billingaddresses = Billingaddress.all
    @billingaddresses = Billingaddress.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @billingaddresses }
    end
  end

  # GET /billingaddresses/1
  # GET /billingaddresses/1.xml
  def show
    @billingaddress = Billingaddress.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @billingaddress 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @billingaddress }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /billingaddresses/new
  # GET /billingaddresses/new.xml
  def new
    if @auth_edit >= 50    
      @billingaddress = Billingaddress.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @billingaddress }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /billingaddresses/1/edit
  def edit
    @billingaddress = Billingaddress.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @billingaddress 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /billingaddresses
  # POST /billingaddresses.xml
  def create
    @billingaddress = Billingaddress.new(params[:billingaddress])

    respond_to do |format|
      if @billingaddress.save
        format.html { redirect_to(@billingaddress, :notice => Billingaddress.human_name + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @billingaddress, :status => :created, :location => @billingaddress }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @billingaddress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /billingaddresses/1
  # PUT /billingaddresses/1.xml
  def update
    @billingaddress = Billingaddress.find(params[:id])

    respond_to do |format|
      if @billingaddress.update_attributes(params[:billingaddress])
        format.html { redirect_to(@billingaddress, :notice => Billingaddress.human_name + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @billingaddress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /billingaddresses/1
  # DELETE /billingaddresses/1.xml
  def destroy   
    @billingaddress = Billingaddress.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @billingaddress
      @billingaddress.destroy

      respond_to do |format|
        format.html { redirect_to(billingaddresses_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end
