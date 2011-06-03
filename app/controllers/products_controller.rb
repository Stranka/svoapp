class ProductsController < ApplicationController
  
  Mime::Type.register "application/pdf", :pdf
    
  # GET /products
  # GET /products.xml
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @productclasses = Productclass.all
    @product = Product.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @product 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    else
      flash[:notice] = 'Fehlende Berechtigung.'
      redirect_to(:action => 'index')
    end

  end

  # GET /products/new
  # GET /products/new.xml
  def new
    if @auth_edit >= 50    
      @product = Product.new
      @productclasses = Productclass.all
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @product }
      end
    else
      flash[:notice] = 'Fehlende Berechtigung.'
      redirect_to(:action => 'index')
    end
  end

  # GET /products/1/edit
  def edit
    @productclasses = Productclass.all
    @product = Product.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @product 
    else
      flash[:notice] = 'Fehlende Berechtigung.'
      redirect_to(:action => 'index')
    end    
    
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    if params[:product][:image_file] != nil
      pic = params[:product][:image_file]
      @product.image_url = pic.original_filename
      
      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename    
      FileUtils.copy(pic.tempfile.path, complete_path)
    end

    if params[:product][:specification_sheet_file] != nil
      pdf = params[:product][:specification_sheet_file] 
      @product.specification_sheet = pdf.original_filename
    
      complete_path = Rails.root.to_s + '/public/sheets/' + pdf.original_filename
      FileUtils.copy(pdf.tempfile.path, complete_path)
    end
      
      
    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    if params[:product][:image_file] != nil
      pic = params[:product][:image_file]
      @product.image_url = pic.original_filename
      
      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename    
      FileUtils.copy(pic.tempfile.path, complete_path)
    end

    if params[:product][:specification_sheet_file] != nil
      pdf = params[:product][:specification_sheet_file] 
      @product.specification_sheet = pdf.original_filename
    
      complete_path = Rails.root.to_s + '/public/sheets/' + pdf.original_filename
      FileUtils.copy(pdf.tempfile.path, complete_path)
    end
        
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy   
    @product = Product.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @product
      @product.destroy

      respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = 'Fehlende Berechtigung.'
      redirect_to(:action => 'index')
    end
  end
  
  def show_products_productclass
    @products = Product.find(:all, :conditions => ['productclass_id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
  end

  def show_specification_sheet
    @product = Product.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @product 
      if params[:mode] == 'show'
        send_file(Rails.root.to_s + '/public/sheets/' + @product.specification_sheet, :type => 'application/pdf', :disposition => 'inline')
#      render :file => Rails.root.to_s + '/public/sheets/' + params[:file] 
      else
        send_file(Rails.root.to_s + '/public/sheets/' + @product.specification_sheet, :type => 'application/pdf', :disposition => 'attachment')
      end
    else
      flash[:notice] = 'Fehlende Berechtigung.'
      redirect_to(:action => 'index')
    end
  end
  

end
