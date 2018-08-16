class CreateProductAssociates < ActiveRecord::Migration[5.2]
  def change
    create_table :product_associates do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :admin, default: false 

      t.timestamps
    end
  end
end
