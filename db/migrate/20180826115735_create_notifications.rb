class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :notification_type
      t.integer :check_status, default: 0
      t.integer :answer_status, default: 0
      t.integer :user_id
 
      t.timestamps
    end
  end
end
 