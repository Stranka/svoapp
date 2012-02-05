class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :telnr
      t.string :mobile
      t.integer :addressable_id
      t.string :addressable_type
      t.string :address_type

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
