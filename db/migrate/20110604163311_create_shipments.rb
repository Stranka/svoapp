class CreateShipments < ActiveRecord::Migration
  def self.up
    create_table :shipments do |t|
      t.string :name
      t.integer :weight_max
      t.integer :lenght_max
      t.integer :scale_id
      t.integer :auth_level
      t.integer :auth_level_edit

      t.timestamps
    end
  end

  def self.down
    drop_table :shipments
  end
end
