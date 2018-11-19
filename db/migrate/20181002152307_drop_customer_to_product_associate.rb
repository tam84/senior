class DropCustomerToProductAssociate < ActiveRecord::Migration[5.2]

  def up
    drop_table :customer_to_product_associates
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
