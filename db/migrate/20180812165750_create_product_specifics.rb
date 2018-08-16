class CreateProductSpecifics < ActiveRecord::Migration[5.2]
  def change
    create_table :product_specifics do |t|
      t.integer :irr_from
      t.integer :coc_from
      t.integer :irr_to
      t.integer :coc_to
      t.integer :deal_size_from
      t.integer :deal_size_to
      t.integer :stake_offered_from
      t.integer :stake_offered_to
      t.integer :revenue_from
      t.integer :revenue_to
      t.integer :ebtida_from
      t.integer :ebtida_to
      t.string :closing_expected
      t.integer :net_debt
      t.integer :product_id
      t.string :investment_structure

      t.timestamps
    end
  end
end
