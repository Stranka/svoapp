class AddArticlesNameToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :articles_name, :string
  end

  def self.down
    remove_column :configurations, :articles_name
  end
end
