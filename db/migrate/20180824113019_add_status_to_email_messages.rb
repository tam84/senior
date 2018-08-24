class AddStatusToEmailMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :email_messages, :status, :integer, default: 0
  end
end
