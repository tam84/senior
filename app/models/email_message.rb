class EmailMessage < ApplicationRecord
	belongs_to :product, optional: true
	#has_many :message_members
	#belongs_to :user
	alias_attribute :user_id, :receiver_id
	has_many :message_answers



	def self.save_email_message params, current_user

		receivers_ids = params[:email_message][:receiver_id].split.map{|i| i.to_i}
		receivers_ids.each do |receiver_id|

		email_message = EmailMessage.new
		email_message.subject = params[:email_message][:subject]
		email_message.text_message = params[:email_message][:text_message]
		email_message.product_id = params[:email_message][:product_id]
		email_message.receiver_id = receiver_id
		email_message.senter_id = current_user.id

		email_message.save!

		email_message.update(email_message_id: email_message.id)

		#EmailMessageMailer.email_message_confirmation(email_message,current_user).deliver

		message_answer = MessageAnswer.new
		message_answer.subject = params[:email_message][:subject]
		message_answer.text_message = params[:email_message][:text_message]
		message_answer.product_id = params[:email_message][:product_id]
		message_answer.receiver_id = receiver_id
		message_answer.senter_id = current_user.id
		message_answer.email_message_id = email_message.email_message_id

		message_answer.save!



		end
	end

	def self.messages_received user
#		email_messages = EmailMessage.where(receiver_id: user.id).order(updated_at: :desc).includes(:product)
#		message_answers = MessageAnswer.where(receiver_id: user.id).order(updated_at: :desc)
#		@messages_received = message_answers + email_messages 




#		@messages_received = []

#		message_answers_email_message_ids = MessageAnswer.where(receiver_id: user.id).order(updated_at: :desc).pluck(:email_message_id).uniq
#		message_answers_email_message_ids.each do |email_message_id|
#			message_answer = MessageAnswer.where(email_message_id: email_message_id).last
#			@messages_received << message_answer
#		end

#		email_messages_email_message_ids = EmailMessage.where(receiver_id: user.id).pluck(:email_message_id).uniq
#		email_messages_email_message_ids.each do |email_message_id|
#			email_message = EmailMessage.where(email_message_id: email_message_id).last
#			email_message_id = email_message.email_message_id
#			if !@messages_received.pluck(:email_message_id).include? email_message_id
				#@messages_received << email_message		
#				@messages_received.insert(0,email_message)	
#			end
#		end

#		


		@messages_received = []

		message_answers_email_message_ids = MessageAnswer.where(receiver_id: user.id).order(updated_at: :desc).pluck(:email_message_id).uniq
		message_answers_email_message_ids.each do |email_message_id|
			message_answer = MessageAnswer.where(email_message_id: email_message_id).last
			@messages_received << message_answer
		end
		@messages_received
		

	end
		
end
 