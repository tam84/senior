class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :street_name
      t.string :street_number
      t.integer :zip_code
      t.string :city
      t.string :room_number
      t.integer :english_level
      t.integer :spanish_level
      t.integer :educational_level
      t.text :short_profile
      t.string :skill_tags, default: [], array: true
      t.integer :age
      t.text :long_profile
      t.string :neighborhood

      t.timestamps
    end
  end
end
