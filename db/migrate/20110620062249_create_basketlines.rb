class CreateBasketlines < ActiveRecord::Migration
  def self.up
    create_table :basketlines do |t|
      t.integer :basket_id
      t.integer :product_id
      t.integer :quantity,            :default => 0, :null => false
      t.decimal :value,               :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :price,               :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.integer :tax_percentage,      :default => 0.0, :null => false
      t.string :producer_number
      t.decimal :weight,              :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :basketlines
  end
end

