class DropReservedRelationsTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :reserved_relations
 end

 def down
    raise ActiveRecord::IrreversibleMigration
 end  	
end
