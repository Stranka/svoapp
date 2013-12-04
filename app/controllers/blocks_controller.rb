class BlocksController < ApplicationController
  
  # GET /blocks
  # GET /blocks.xml
  def index
    @blocks = Block.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blocks }
    end
  end

  # GET /blocks/1
  # GET /blocks/1.xml
  def show
    @block = Block.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @block 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @block }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end

  end

  # GET /blocks/new
  # GET /blocks/new.xml
  def new
    if @auth_edit >= 50
      @block = Block.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @block }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end      
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @block 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # POST /blocks
  # POST /blocks.xml
  def create
    @block = Block.new(params[:block])

    respond_to do |format|
      if @block.save
        format.html { redirect_to(@block, :notice => Block.model_name.human + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @block, :status => :created, :location => @block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blocks/1
  # PUT /blocks/1.xml
  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to(@block, :notice => Block.model_name.human + ' ' + t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.xml
  def destroy
    @block = Block.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @block
      @block.destroy
  
      respond_to do |format|
        format.html { redirect_to(blocks_url) }
        format.xml  { head :ok }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

end
