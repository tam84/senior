class AddKeyInformationToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :key_information, :string
  end
end
