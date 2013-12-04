class ShipmentsController < ApplicationController
  # GET /shipments
  # GET /shipments.xml
  def index
    @shipments = Shipment.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.xml
  def show
    @shipment = Shipment.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @shipment
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @shipment }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /shipments/new
  # GET /shipments/new.xml
  def new
    if @auth_edit >= 50
      @shipment = Shipment.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @shipment }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /shipments/1/edit
  def edit
    @shipment = Shipment.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @shipment
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # POST /shipments
  # POST /shipments.xml
  def create
    @shipment = Shipment.new(params[:shipment])

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to(@shipment, :notice => Shipment.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipments/1
  # PUT /shipments/1.xml
  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        format.html { redirect_to(@shipment, :notice => Shipment.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.xml
  def destroy
    @shipment = Shipment.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @shipment
      @shipment.destroy

      respond_to do |format|
        format.html { redirect_to(shipments_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
end

