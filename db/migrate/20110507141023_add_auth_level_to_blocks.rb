class AddAuthLevelToBlocks < ActiveRecord::Migration
  def self.up
    add_column :blocks, :auth_level, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :blocks, :auth_level
  end
end
