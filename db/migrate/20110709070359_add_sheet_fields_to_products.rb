class AddSheetFieldsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :sheet_file_name, :string
    add_column :products, :sheet_content_type, :string
    add_column :products, :sheet_file_size, :integer
    remove_column :products, :specification_sheet
  end

  def self.down
    remove_column :products, :sheet_file_size
    remove_column :products, :sheet_content_type
    remove_column :products, :sheet_file_name
    add_column :products, :specification_sheet, :string
  end
end

