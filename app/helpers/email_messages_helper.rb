module EmailMessagesHelper

	def name_of_senter message
		@senter_name = User.find_by(id: message.senter_id).name
	end

	def group_message_id message_id
		group_message_id = EmailMessage.find_by(id: message_id)
	end


end
