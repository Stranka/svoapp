class AddAncestryToMenues < ActiveRecord::Migration
  def self.up
    add_column :menues, :ancestry, :string
  end

  def self.down
    remove_column :menues, :ancestry
  end
end
