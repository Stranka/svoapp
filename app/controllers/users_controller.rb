class UsersController < ApplicationController

  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @user
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if @auth_edit >= 50
      @user = User.new
      @user.build_billingaddress
      @user.build_deliveryaddress

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @user
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
    if @user.billingaddress.nil?
      @user.build_billingaddress
    end
    if @user.deliveryaddress.nil?
      @user.build_deliveryaddress
    end
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.auth_level > @auth_show
      @user.auth_level = @auth_show
    end
    if @user.auth_level_edit > @auth_edit
      @user.auth_level_edit = @auth_edit
    end
    respond_to do |format|
      if @user.save
        UserSessionsController::new

        format.html { redirect_to(@user, :notice => User.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => User.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @user
      @user.destroy

      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /customer/new
  # GET /customers/new.xml
  def new_customer
    @user = User.new
      @user.build_billingaddress
      @user.build_deliveryaddress

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new_address

  end

  def del_address

  end
end

