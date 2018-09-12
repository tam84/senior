class RemoveInvestmentPeriodFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :investment_period_from, :integer
    remove_column :products, :investment_period_to, :integer
  end
end
