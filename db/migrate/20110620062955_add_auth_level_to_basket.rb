class AddAuthLevelToBasket < ActiveRecord::Migration
  def self.up
    add_column :baskets, :auth_level, :integer,        :default => 0, :null => false
    add_column :baskets, :auth_level_edit, :integer,   :default => 0, :null => false
  end

  def self.down
    remove_column :baskets, :auth_level_edit
    remove_column :baskets, :auth_level
  end
end

