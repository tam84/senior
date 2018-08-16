class AddEmailMessageIdToEmailMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :email_messages, :email_message_id, :integer
  end
end
