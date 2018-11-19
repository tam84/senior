class AddConfidentialToEmailMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :email_messages, :confidential, :boolean, default: false
  end
end
