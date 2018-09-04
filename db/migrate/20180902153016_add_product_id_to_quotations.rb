class AddProductIdToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :product_id, :integer
  end
end
