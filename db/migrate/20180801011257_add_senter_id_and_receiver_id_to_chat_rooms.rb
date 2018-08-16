class AddSenterIdAndReceiverIdToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :senter_id, :integer
    add_column :chat_rooms, :receiver_id, :integer
  end
end
