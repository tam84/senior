class CreateEmailMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :email_messages do |t|
      t.text :subject
      t.text :text_message
      t.integer :product_id
      t.integer :receiver_id
      t.integer :senter_id

      t.timestamps
    end
  end
end
  