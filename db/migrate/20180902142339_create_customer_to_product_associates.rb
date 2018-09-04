class CreateCustomerToProductAssociates < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_to_product_associates do |t|
      t.integer :user_id
      t.integer :product_associate_id

      t.timestamps
    end
  end
end
