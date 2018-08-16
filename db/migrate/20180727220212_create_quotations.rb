class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.integer :senter_id
      t.integer :receiver_id
      t.string :quote
      t.text :senter_message
      t.text :receiver_message
      t.integer :firm_id
      t.integer :category_id

      t.timestamps
    end
  end
end
