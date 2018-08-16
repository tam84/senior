class CreateMessageAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :message_answers do |t|
      t.text :subject
      t.text :text_message
      t.integer :product_id
      t.integer :receiver_id
      t.integer :senter_id      
      t.integer :email_message_id

      t.timestamps
    end
  end
end
