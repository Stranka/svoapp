class AddUserIdToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :user_id, :integer
    remove_column :addresses, :addressable_id
  end

  def self.down
    remove_column :addresses, :user_id
    add_column :addresses, :addressable_id, :integer
  end
end
