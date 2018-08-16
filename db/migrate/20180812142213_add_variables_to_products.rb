class AddVariablesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :performance_fee, :integer
    add_column :products, :admin_fee, :integer
    add_column :products, :status, :string
    add_column :products, :other_obs, :string
    add_column :products, :target_return_benchmark_from, :integer
    add_column :products, :target_return_benchmark_to, :integer
    add_column :products, :country, :string
    add_column :products, :investment_period_from, :integer
    add_column :products, :investment_period_to, :integer
  end
end
