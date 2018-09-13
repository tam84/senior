class CreateContactMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_messages do |t|
      t.text :content
      t.string :name
      t.string :email
      t.text :contacts
      t.string :firm

      t.timestamps
    end
  end
end
