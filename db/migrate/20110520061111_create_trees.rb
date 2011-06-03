class CreateTrees < ActiveRecord::Migration
  def self.up
    create_table :trees do |t|
      t.string :session_id
      t.string :model
      t.integer :model_id
      t.string :ancestry

      t.timestamps
    end
    
    add_index(:trees,[:session_id, :model, :model_id])
  end

  def self.down
    drop_table :trees
  end
end
