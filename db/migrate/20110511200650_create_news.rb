class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.date :date
      t.string :notice
      t.string :format
      t.integer :auth_level,                  :null => false, :default => 0
      t.integer :auth_level_edit,             :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
