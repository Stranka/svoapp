class AddAuthLevelToProductclass < ActiveRecord::Migration
  def self.up
    add_column :productclasses, :auth_level, :integer, :null => false, :default => 0
    add_column :productclasses, :auth_level_edit, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :productclasses, :auth_level_edit
    remove_column :productclasses, :auth_level
  end
end
