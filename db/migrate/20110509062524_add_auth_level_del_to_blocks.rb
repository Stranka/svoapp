class AddAuthLevelDelToBlocks < ActiveRecord::Migration
  def self.up
    add_column :blocks, :auth_level_edit, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :blocks, :auth_level_edit
  end
end
