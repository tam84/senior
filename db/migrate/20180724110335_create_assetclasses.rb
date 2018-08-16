class CreateAssetclasses < ActiveRecord::Migration[5.2]
  def change
    create_table :assetclasses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
