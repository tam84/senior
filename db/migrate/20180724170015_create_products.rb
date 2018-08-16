class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :management_firm
      t.string :manager
      t.string :administrator
      t.string :destribuitor
      t.string :cnpj
      t.string :inception_date
      t.string :minimal_investment
      t.string :maximum_investment
      t.string :target_investor
      t.string :benchmark
      t.integer :assetclass_id
      t.integer :category_id
      t.integer :firm_id

      t.timestamps
    end
  end
end
