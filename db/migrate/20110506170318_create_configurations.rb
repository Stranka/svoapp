class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.boolean :block_left
      t.integer :block_left_width
      t.boolean :block_right
      t.integer :block_right_width
      t.integer :pagewidth
      t.boolean :block_headerline
      t.string :position_logo

      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
