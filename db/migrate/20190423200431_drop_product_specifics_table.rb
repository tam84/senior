class DropProductSpecificsTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :product_specifics
 end

 def down
    raise ActiveRecord::IrreversibleMigration
 end  	

end
