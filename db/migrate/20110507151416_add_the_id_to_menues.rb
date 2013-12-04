class AddTheIdToMenues < ActiveRecord::Migration
  def self.up
    add_column :menues, :the_id, :integer
  end

  def self.down
    remove_column :menues, :the_id
  end
end
