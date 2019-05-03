class RemoveFieldsFromProductArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_articles, :product_id, :integer
  end
end
