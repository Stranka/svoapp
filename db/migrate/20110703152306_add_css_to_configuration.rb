class AddCssToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :theme, :string
    add_column :configurations, :title, :string
  end

  def self.down
    remove_column :configurations, :title
    remove_column :configurations, :theme
  end
end

