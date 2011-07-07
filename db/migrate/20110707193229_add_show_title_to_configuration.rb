class AddShowTitleToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :show_title, :boolean,   :default => false
  end

  def self.down
    remove_column :configurations, :show_title
  end
end

