class DropChatRoomsTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :chat_rooms
 end

 def down
    raise ActiveRecord::IrreversibleMigration
 end  	
end
