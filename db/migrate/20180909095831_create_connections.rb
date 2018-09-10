class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :followed_id
      t.string :followed_type
      t.integer :user_id

      t.timestamps
    end
  end
end
