class AddPaperclipFieldsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :image_file_name, :string
    add_column :products, :image_content_type, :string
    add_column :products, :image_file_size, :integer
    remove_column :products, :image_url
  end

  def self.down
    remove_column :products, :image_file_size
    remove_column :products, :image_content_type
    remove_column :products, :image_file_name
    add_column :products, :image_url, :string
  end
end

