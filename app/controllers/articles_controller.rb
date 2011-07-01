class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.find(:all, :conditions => ['auth_level <= ?', @auth_show])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show        
    @article = Article.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    if @article 
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @article }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
  
  # GET /articles/1
  # GET /articles/1.xml
  def permalink
    @showarticle = Article.find(:first, :conditions => ['name = ? and auth_level <= ?', params[:id], @auth_show])
    begin
    end while @showarticle.content.sub!(/\[\[(\w+)\]\]/,'<a href="/articles/\\1/permalink">\\1</a>')
    if @showarticle == nil     
      @showarticle = Article.new
      @showarticle.name = t('Sorry')
      @showarticle.content = t('access denied')
    end
    render "show_content"
  end  

  # GET /articles/new
  # GET /articles/new.xml
  def new
    if @auth_edit >= 50
      @article = Article.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @article }
      end
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # GET /articles/1/edit
  def edit    
    @article = Article.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @article 
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => Article.human_name + ' ' + t('was successfully created')) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => Article.human_name + ' ' +  t('was successfully updated')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy     
    @article = Article.find(:first, :conditions => ['id = ? and auth_level_edit <= ?', params[:id], @auth_edit])
    if @article
      @article.destroy
      respond_to do |format|
        format.html { redirect_to(articles_url) }
        format.xml  { head :ok }
      end    
    else
      flash[:notice] = t('access denied')
      redirect_to(:action => 'index')
    end
  end
  
  # GET /articles/1
  # GET /articles/1.xml
  def show_content   
    @showarticle = Article.find(:first, :conditions => ['id = ? and auth_level <= ?', params[:id], @auth_show])
    begin
    end while @showarticle.content.sub!(/\[\[(\w+)\]\]/,'<a href="/articles/\\1/permalink">\\1</a>')
    if @showarticle == nil     
      @showarticle = Article.new
      @showarticle.name = t('Sorry')
      @showarticle.content = t('access denied')
    end
    respond_to do |format|
      format.html # show_article.html.erb
      format.xml  { render :xml => @article }
    end
  end  
 end
