class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :postable_id
      t.string :postable_type

      t.timestamps
    end
  end
end
