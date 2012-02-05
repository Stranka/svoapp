class ProductsController < ApplicationController

  Mime::Type.register "application/pdf", :pdf

  # GET /products
  # GET /products.xml
  def index
    @products = Product.find(:all, :conditions => ['auth_level <= ?', @auth_show])

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
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /products/new
  # GET /products/new.xml
  def new
    if @auth_edit >= 50
      @product = Product.new
      @productclasses = Productclass.all
      2.times { @product.assets.build }

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @product }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /products/1/edit
  def edit
    @productclasses = Productclass.all
    @product = Product.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    2.times { @product.assets.build }

    if @product
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.create(params[:product])
    @product.update_attribute(:price, params[:product][:price].tr('.','').tr(',','.'))
    @productclasses = Productclass.all

#    if params[:product][:image_file] != nil
#      pic = params[:product][:image_file]
#      @product.image_url = pic.original_filename

#      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename
#      FileUtils.copy(pic.tempfile.path, complete_path)
#    end

#    if params[:product][:specification_sheet_file] != nil
#      pdf = params[:product][:specification_sheet_file]
#      @product.specification_sheet = pdf.original_filename

#      complete_path = Rails.root.to_s + '/public/sheets/' + pdf.original_filename
#      FileUtils.copy(pdf.tempfile.path, complete_path)
#    end


    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => Product.human_name + ' ' + t('was successfully created')) }
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
    @productclasses = Productclass.all
#    if params[:product][:image_file] != nil
#      pic = params[:product][:image_file]
#      @product.image_url = pic.original_filename

#      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename
#      FileUtils.copy(pic.tempfile.path, complete_path)
#    end

#    if params[:product][:specification_sheet_file] != nil
#      pdf = params[:product][:specification_sheet_file]
#      @product.specification_sheet = pdf.original_filename

#      complete_path = Rails.root.to_s + '/public/sheets/' + pdf.original_filename
#      FileUtils.copy(pdf.tempfile.path, complete_path)
#    end

    respond_to do |format|

      if @product.update_attributes(params[:product])
        @product.update_attribute(:price, params[:product][:price].tr('.','').tr(',','.'))
        format.html { redirect_to(@product, :notice => Product.human_name + ' ' + t('was successfully updated')) }
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
      flash[:notice] = t('access denied')
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
#        send_file(Rails.root.to_s + '/public/sheets/' + @product.sheet, :type => 'application/pdf', :disposition => 'inline')
        send_file @product.sheet.path, :type => @product.sheet_content_type, :disposition => 'inline'

#      render :file => Rails.root.to_s + '/public/sheets/' + params[:file]
      else
#        send_file(Rails.root.to_s + '/public/sheets/' + @product.sheet, :type => 'application/pdf', :disposition => 'attachment')
        send_file @product.sheet.path, :type => @product.sheet_content_type, :disposition => 'attachment'
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  def product_detail

    case params[:tab]

      when 'general', nil
        set_tab :general
      when 'description'
        set_tab :description
      when 'picture'
        set_tab :picture
    end

    @product = Product.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @product
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  def search_all

    if params[:pquery] != '' and params[:pquery] != nil
      @query = '%' + params[:pquery] + '%'
      @products = Product.find(:all, :conditions => ['auth_level <= ? and ( shorttext like ? or description like ?)', @auth_show, @query, @query])
      flash[:notice] = t('searchstring') + "'" + params[:pquery] + "'"
    else
      @products = Product.find(:all, :conditions => ['id = ?', 'xhnfgdthdasFGHFCBYJSXFSADF'])
      flash[:notice] = t('please specify a searchstring')
    end
    render 'show_products_productclass'

  end
end

