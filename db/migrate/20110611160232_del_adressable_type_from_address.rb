class DelAdressableTypeFromAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :addressable_type
  end

  def self.down
    add_column :addresses, :addressable_type, :string
  end
end
