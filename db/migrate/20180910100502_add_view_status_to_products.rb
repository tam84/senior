class AddViewStatusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :view_status, :integer, default: 0
  end
end
