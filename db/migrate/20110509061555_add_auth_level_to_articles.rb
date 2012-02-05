class AddAuthLevelToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :auth_level_edit, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :articles, :auth_level_edit
  end
end
