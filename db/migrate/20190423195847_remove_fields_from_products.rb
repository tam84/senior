class RemoveFieldsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :key_information, :string
    remove_column :products, :admin_fee, :integer
    remove_column :products, :performance_fee, :integer
    remove_column :products, :manager, :string
    remove_column :products, :administrator, :string
    remove_column :products, :cnpj, :string
    remove_column :products, :minimal_investment, :string
    remove_column :products, :maximum_investment, :string
    remove_column :products, :target_investor, :string
    remove_column :products, :benchmark, :string
    remove_column :products, :total_investment, :integer
    remove_column :products, :status, :string
  end
end
