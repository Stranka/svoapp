class ProductclassesController < ApplicationController
  # GET /productclasses
  # GET /productclasses.xml
  def index
    @productclasses = Productclass.find(:all, :conditions => ['auth_level <= ?', @auth_show])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @productclasses }
    end
  end

  # GET /productclasses/1
  # GET /productclasses/1.xml
  def show
    @productclass = Productclass.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @productclass 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @productclass }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
  
  # GET /productclasses/new
  # GET /productclasses/new.xml
  def new
    if @auth_edit >= 50    
      @productclass = Productclass.new
      @prclasses = Productclass.find(:all) 
      
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @productclass }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end    

  # GET /productclasses/1/edit
  def edit
    @productclass = Productclass.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @productclass 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end 
    @prclasses = Productclass.find(:all)
  end

  # POST /productclasses
  # POST /productclasses.xml
  def create
    @productclass = Productclass.new(params[:productclass])
    if @productclass.parent_id == nil
      @productclass.parent_id = 0
    end

    if params[:productclass][:picture_field] != nil
      pic = params[:productclass][:picture_field]
      @productclass.picture = pic.original_filename
      
      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename    
      FileUtils.copy(pic.tempfile.path, complete_path)
    end
        
    respond_to do |format|
      if @productclass.save
        format.html { redirect_to(@productclass, :notice => Productclass.human_name + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @productclass, :status => :created, :location => @productclass }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @productclass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /productclasses/1
  # PUT /productclasses/1.xml
  def update
    @productclass = Productclass.find(params[:id])
    if @productclass.parent_id == nil
      @productclass.parent_id = 0
    end

    if params[:productclass][:picture_field] != nil
      pic = params[:productclass][:picture_field]
      @productclass.picture = pic.original_filename
      
      complete_path = Rails.root.to_s + '/public/images/' + pic.original_filename    
      FileUtils.copy(pic.tempfile.path, complete_path)
    end
            
    respond_to do |format|
      if @productclass.update_attributes(params[:productclass])
        format.html { redirect_to(@productclass, :notice => Productclass.human_name + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @productclass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /productclasses/1
  # DELETE /productclasses/1.xml
  def destroy
    @productclass = Productclass.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @productclass
      @productclass.destroy

      respond_to do |format|
        format.html { redirect_to(productclasses_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
  
  def click
    @tree = Tree.find(:first, :conditions => ['session_id = ? and model = ? and model_id = ?', request.session_options[:id], 'productclass', params[:id]])
#    @menue = Menue.find(params[:id])
    if @tree == nil
      @tree = Tree.new
      @tree.session_id = request.session_options[:id]
      @tree.model = 'productclass'
      @tree.model_id = params[:id]
      @tree.ancestry = 'close'
    else
      if @tree.ancestry == 'close'
        @tree.ancestry = 'open'
      else
        @tree.ancestry = 'close'
      end
    end 
    @tree.save
    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])
  end

  def up
    @productclass = Productclass.find(params[:id])
    @productclass.move_higher

    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])

  end
  
  def down
    @productclass = Productclass.find(params[:id])
    @productclass.move_lower

    redirect_to(:controller => params[:co], :action => params[:ac], :id => params[:pid])
  end
end
