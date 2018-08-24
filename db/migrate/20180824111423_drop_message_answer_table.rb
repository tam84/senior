class DropMessageAnswerTable < ActiveRecord::Migration[5.2]

  def up
    drop_table :message_answers
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
