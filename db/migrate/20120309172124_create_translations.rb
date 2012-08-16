class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.string :locale
      t.string :key
      t.string :value
      t.text :interpolations
      t.boolean :is_proc
      t.integer :auth_level
      t.integer :auth_level_edit

      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
