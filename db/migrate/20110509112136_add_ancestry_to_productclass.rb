class AddAncestryToProductclass < ActiveRecord::Migration
  def self.up
    add_column :productclasses, :ancestry, :string
    add_index :productclasses, :ancestry     
  end

  def self.down
    remove_column :productclasses, :ancestry
    remove_index :productclasses, :ancestry
  end
end
