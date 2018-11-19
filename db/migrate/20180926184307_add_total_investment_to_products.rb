class AddTotalInvestmentToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :total_investment, :integer
  end
end
