class AddFieldsToProductArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :product_articles, :category_id, :integer
    add_column :product_articles, :assetclass_id, :integer
  end
end
