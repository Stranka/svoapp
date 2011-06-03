class AddAuthLevelToMenues < ActiveRecord::Migration
  def self.up
    add_column :menues, :auth_level, :integer, :null => false, :default => 0
    add_column :menues, :auth_level_edit, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :menues, :auth_level_edit
  end
end
