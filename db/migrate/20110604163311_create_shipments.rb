class CreateShipments < ActiveRecord::Migration
  def self.up
    create_table :shipments do |t|
      t.string :name
      t.integer :weight_max,                       :null => false, :default => 0
      t.integer :lenght_max,                       :null => false, :default => 0
      t.integer :scale_id,                         :null => false, :default => 0
      t.integer :auth_level,                       :null => false, :default => 0
      t.integer :auth_level_edit,                  :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :shipments
  end
end

