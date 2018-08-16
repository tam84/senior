class MessageAnswer < ApplicationRecord

	belongs_to :product, optional: true
	belongs_to :email_message
	
	def save_answer message_answer, params, user

		message_answer.senter_id = user.id
		message_answer.receiver_id = params[:message_answer][:senter_id]
		message_answer.product_id = params[:message_answer][:product_id]
		message_answer.email_message_id = params[:message_answer][:email_message_id] 
		message_answer.subject = params[:message_answer][:subject] 
		message_answer.text_message = params[:message_answer][:text_message] 


		message_answer.save!
	end
end
