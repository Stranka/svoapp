class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :title, :string
    add_column :users, :wwwadress, :string
    add_column :users, :taxnumber, :string
    add_column :users, :customernumber, :string
    add_column :users, :customergroup_id, :integer
  end

  def self.down
    remove_column :users, :customergroup_id
    remove_column :users, :customernumber
    remove_column :users, :taxnumber
    remove_column :users, :wwwadress
    remove_column :users, :title
  end
end
