class AddManageTreeToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :manage_tree, :boolean, :default => false
  end

  def self.down
    remove_column :configurations, :manage_tree
  end
end
