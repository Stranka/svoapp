class Menue < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :the_action, :the_id, :if => :check_controller?

  acts_as_tree :order => "position"
  acts_as_list :scope => :parent_id

  AC_ARTICLE = ['show_content', 'showme']
  AC_NEWS = ['all_news', 'index']
  AC_REST = ['index']



  def check_controller?
    case self.the_controller
      when 'articles'
        if self.the_action == 'index'
          errors.add(:the_action, '-> Darf nicht -index- sein')
        end
        return true
      when 'news'
        return false
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

