class MessageAnswer < ApplicationRecord

	belongs_to :product, optional: true
	belongs_to :email_message
	

end
 