class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.string :format
      t.integer :auth_level, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
