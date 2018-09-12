class AddInvestimentPeriodToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :from_investment_period, :datetime
    add_column :products, :to_investment_period, :datetime
  end
end
