class Menue < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :the_action, :the_id, :if => :check_controller?

  acts_as_tree :order => "position"
  acts_as_list :scope => :parent_id

  AC = ['', 'index', 'showme', 'show_content']
  CO = ['', 'articles', 'baskets', 'blocks', 'configurations', 'menues', 'news', 'pictures', 'productclasses', 'products', 'shipments','users'];


  def check_controller?
    case self.the_controller
      when 'articles'
        if self.the_action == 'index'
          errors.add(:the_action, '-> Darf nicht -index- sein')
        end
        return true
      when ''
        self.the_action = ''
        self.the_id = nil
        return false
      else
        self.the_action = 'index'
        self.the_id = nil
        return false
    end
  end
end

