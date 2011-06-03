class AddTopimageToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :topimage, :boolean
  end

  def self.down
    remove_column :configurations, :topimage
  end
end
