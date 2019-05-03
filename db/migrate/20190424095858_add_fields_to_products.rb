class AddFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :street_name, :string
    add_column :products, :street_number, :string
    add_column :products, :zip_code, :integer
    add_column :products, :city, :string
    add_column :products, :room_number, :string
    add_column :products, :neighborhood, :string
    add_column :products, :english_level, :integer
    add_column :products, :spanish_level, :integer
    add_column :products, :educational_level, :integer
    add_column :products, :skill_tags, :string, default: [], array: true
    add_column :products, :age, :integer
    add_column :products, :user_id, :integer        
    add_column :products, :requirement, :text
    remove_column :products, :country, :string    
  end
end
