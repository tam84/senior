class AddVariablesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :whatsapp, :integer
    add_column :users, :skype, :string
    add_column :users, :linkedin, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :firm_phone, :string
    add_column :users, :official_registration, :string
    add_column :users, :website, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean, default: false 
    add_column :users, :address, :string
    add_column :users, :firm_id, :integer
  end
end