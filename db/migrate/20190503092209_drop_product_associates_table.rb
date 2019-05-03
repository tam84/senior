class DropProductAssociatesTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :product_associates
 end

 def down
    raise ActiveRecord::IrreversibleMigration
 end  	
end
