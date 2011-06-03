class CreateMenues < ActiveRecord::Migration
  def self.up
    create_table :menues do |t|
      t.string :name
      t.integer :position
      t.string :the_url
      t.string :the_controller
      t.string :the_action
      t.integer :role
      t.integer :parent_id,                       :null => false, :default => 0
      t.boolean :ontop
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :menues
  end
end
