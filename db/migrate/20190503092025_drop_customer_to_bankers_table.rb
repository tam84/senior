class DropCustomerToBankersTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :customer_to_bankers
 end

 def down
    raise ActiveRecord::IrreversibleMigration
 end  	
end
