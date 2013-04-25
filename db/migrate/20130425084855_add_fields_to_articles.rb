class AddFieldsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :meta_tag_title, :string
    add_column :articles, :meta_tag_keywords, :string
  end
end
