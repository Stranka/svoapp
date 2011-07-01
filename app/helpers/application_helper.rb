module ApplicationHelper


  def read_menue
    @usermenue = Menue.find(:all, :conditions => ['auth_level <= ? and active = ? and parent_id = ?', @auth_show, true, 0], :order => "position")
  end

  def read_productclass
    @productclasses = Productclass.find(:all, :conditions => {:parent_id => 0}, :order => 'position')
#    @productclasses = Productclass.find(:all)
  end

  def read_block_news
    @news = News.find(:all, :order => "date DESC", :limit => '2')
  end

  def read_article(title)
    @article = Article.find(:all, :conditions => {:name => title})
  end

  def read_basket(session)
    @warenkorb = Basket.find_by_session_id(session)
    if @warenkorb.nil?
      @warenkorb = Basket.new
    end
    @warenkorb
  end

  def check_tree(model, model_id)
    @tree = Tree.find(:first, :conditions => ['session_id = ? and model = ? and model_id = ?', request.session_options[:id], model, model_id])
    if @tree == nil
      return 'open'
    end
    return @tree.ancestry
  end


  def read_userblock_1
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_2
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_3
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_4
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_5
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_6
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_7
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_8
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end
  def read_userblock_9
    @article = Article.find(:all, :conditions => {:name => 'Referenzen'})
  end

end

