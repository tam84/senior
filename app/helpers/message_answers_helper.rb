module MessageAnswersHelper

	def first_message email_message_id
		email_message = EmailMessage.find_by(id: email_message_id)
	end

	def senter_name user_id
		user = User.find_by(id: user_id).name
	end

	def receiver_name id
		user = User.find_by(id: user_id).name
	end



end
