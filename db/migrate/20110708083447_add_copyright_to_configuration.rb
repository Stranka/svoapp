class AddCopyrightToConfiguration < ActiveRecord::Migration
  def self.up
    add_column :configurations, :copyright, :string
  end

  def self.down
    remove_column :configurations, :copyright
  end
end
