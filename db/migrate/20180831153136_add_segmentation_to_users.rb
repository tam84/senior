class AddSegmentationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :segmentation, :string, array:true, default: []
  end
end
