class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :name
      t.decimal :cost,                       :null => false, :default => 0
      t.integer :auth_level,                 :null => false, :default => 0
      t.integer :auth_level_edit,            :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end

