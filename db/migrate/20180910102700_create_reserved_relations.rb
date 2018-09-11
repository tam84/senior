class CreateReservedRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :reserved_relations do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
