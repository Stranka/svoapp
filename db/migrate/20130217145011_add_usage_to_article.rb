class AddUsageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :usage, :string
  end
end
