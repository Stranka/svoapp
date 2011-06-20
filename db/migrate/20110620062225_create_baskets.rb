class CreateBaskets < ActiveRecord::Migration
  def self.up
    create_table :baskets do |t|
      t.integer :session_id
      t.integer :customer_id
      t.string :status
      t.string :shipmentterms
      t.string :paymentterms
      t.string :order_number
      t.string :store

      t.timestamps
    end
  end

  def self.down
    drop_table :baskets
  end
end
