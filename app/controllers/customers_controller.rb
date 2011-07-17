class CustomersController < ApplicationController

  def index
    @customer = Customer.find(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  def show
    @customer = Customer.find_by_id(current_user.id)       
    if @customer 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @usercustomer}
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'edit')
    end

  end

  def new
  
    @customer = Customer.new
    @customer.build_billingaddress
    @customer.build_deliveryaddress
    
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
    if @customer 
    else
      flash[:notice] = t('access denied')
      redirect_to(:controller => 'customers', :action => 'edit')
    end    
    if @customer.billingaddress.nil?
      @customer.build_billingaddress
    end    
    if @customer.deliveryaddress.nil?
      @customer.build_deliveryaddress
    end
  end

  # POST /customers
  # POST /customers.xml
  def create
    @customer = Customer.new(params[:customer])
    respond_to do |format|
      if @customer.save       
        UserSessionsController::new
        
        format.html { redirect_to(@customer, :notice => Customer.human_name + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @customer, :status => :created, :location => @customer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.xml
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to(@customer, :notice => Customer.human_name + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
