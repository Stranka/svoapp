class AddShopActiveToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :shop_active, :boolean,   :default => false
  end

  def self.down
    remove_column :configurations, :shop_active
  end
end

