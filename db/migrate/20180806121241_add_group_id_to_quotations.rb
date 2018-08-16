class AddGroupIdToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :group_id, :string
  end
end
