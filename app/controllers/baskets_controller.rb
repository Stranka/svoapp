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

  def add_to_basket
    @product = Product.find(params[:id])

#    @basket = Basket.find_by_session_id(request.session_options[:id])
#    if @basket
#      @basketline = Basketline.find(:first, :conditions => ['product_id = ? and basket_id <= ?', @product.id, @basket.id])
#      if @basketline
#        change_basketline_quantity
#        @basketline.save
#      else
#        create_basketline
#      end
#    else
#      create_basket
#      create_basketline
#    end

    @basket = Basket.find_by_session_id(request.session_options[:id])
    @basket ||= create_basket       # || ist ein oder => gibt es @basket ok, wenn nicht führe create_basket aus
    @basketline = Basketline.find(:first, :conditions => ['product_id = ? and basket_id <= ?', @product.id, @basket.id])
    @basketline ||= create_basketline
    change_basketline_quantity
    @basketline.save


    @products = Product.find(:all, :conditions => ['productclass_id = ? and auth_level_edit <= ?', @product.productclass.id, @auth_edit])
    redirect_to(:controller => 'products', :action => 'show_products_productclass', :id => @product.productclass.id)

  end

  def show_my_open_order
    @basket = Basket.find(:first, :conditions => ['session_id = ? and status = ?', request.session_options[:id], 'offen'])
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

  def checkout

  end


protected

  def create_basket
    @basket = Basket.new
    @basket.session_id = request.session_options[:id]
    if current_user != nil
      @basket.customer_id = current_user.id
      @basket.auth_level = current_user.auth_level
      @basket.auth_level_edit = current_user.auth_level_edit
    end
    @basket.status = 'offen'
    @basket.save
    return @basket
  end

  def change_basketline_quantity
    @basketline.quantity += params[:basketline][:quantity].to_i
    @basketline.value = @basketline.quantity * @basketline.price
  end

  def create_basketline
    @basketline = Basketline.new
    @basketline.basket_id = @basket.id
    @basketline.product_id = @product.id
    @basketline.quantity = 0
    if @product.special_price > 0 and @product.special_price < @product.price
      @basketline.price = @product.special_price
    else
      @basketline.price = @product.price
    end

    @basketline.tax_percentage = @product.tax_percentage
#    @basketline.producer_number = @product.producer_number

    return @basketline
  end
end

