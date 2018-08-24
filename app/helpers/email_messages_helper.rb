module EmailMessagesHelper

	def name_of_senter message
		@senter_name = User.find_by(id: message.senter_id).name
	end
 
	def group_message_id message_id
		group_message_id = EmailMessage.find_by(id: message_id)
	end

	def subject_helper email_message_id
		EmailMessage.where(email_message_id: email_message_id).last.present?
		email_message_subject = EmailMessage.where(email_message_id: email_message_id).last.subject
		subject = "res:" + email_message_subject
	end


	def first_message email_message_id
		email_message = EmailMessage.find_by(id: email_message_id)
	end

	def senter_name user_id
		user = User.find_by(id: user_id).full_name
	end

	def receiver_name id
		user = User.find_by(id: user_id).full_name
	end

	def message_answered message, user
		email_message = EmailMessage.where(email_message_id: message.email_message_id, senter_id: user.id).last
		if email_message
			email_message.answered?
		else
			true
		end
		
	end
	

end
 