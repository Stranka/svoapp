class CreateProductclasses < ActiveRecord::Migration
  def self.up
    create_table :productclasses do |t|
      t.string :name
      t.integer :parent_id
      t.string :picture
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :productclasses
  end
end
