class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.string :name
      t.string :headerline
      t.string :position
      t.integer :fieldorder
      t.integer :blockid
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
