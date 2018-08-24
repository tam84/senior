module EmailMessagesHelper

	def name_of_senter message
		@senter_name = User.find_by(id: message.senter_id).name
	end

	def group_message_id message_id
		group_message_id = EmailMessage.find_by(id: message_id)
	end

	def subject_helper email_message_id
		if MessageAnswer.where(email_message_id: email_message_id).last.present?
			message_answer_subject = MessageAnswer.where(email_message_id: email_message_id).last.subject
			subject = "res:" + message_answer_subject
		else
			EmailMessage.where(email_message_id: email_message_id).last.present?
			email_message_subject = EmailMessage.where(email_message_id: email_message_id).last.subject
			subject = "res:" + email_message_subject
		end
	end
end
 