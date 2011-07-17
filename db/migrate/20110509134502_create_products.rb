class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :shorttext
      t.text :description
      t.string :producer
      t.decimal :price,                       :null => false, :default => 0
      t.decimal :special_price,               :null => false, :default => 0
      t.string :product_features
      t.decimal :weight,                      :null => false, :default => 0
      t.string :unit_of_weight
      t.string :unit_of_quantity
      t.integer :tax_percentage,              :null => false, :default => 0
      t.string :image_url
      t.string :specification_sheet
      t.integer :auth_level,                  :null => false, :default => 0
      t.integer :auth_level_edit,             :null => false, :default => 0
      t.integer :productclass_id                  
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
