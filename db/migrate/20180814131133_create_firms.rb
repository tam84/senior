class CreateFirms < ActiveRecord::Migration[5.2]
  def change
    create_table :firms do |t|
      t.string :name
      t.text :description
      t.string :whatsapp
      t.string :skype
      t.string :linkedin
      t.string :facebook
      t.string :instagram
      t.string :firm_phone
      t.string :cnpj
      t.string :website
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
