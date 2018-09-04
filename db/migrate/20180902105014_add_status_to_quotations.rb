class AddStatusToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :status, :integer, default: 0
  end
end
