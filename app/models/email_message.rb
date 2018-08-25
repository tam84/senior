class EmailMessage < ApplicationRecord
	belongs_to :product, optional: true
	#has_many :message_members
	#belongs_to :user
	alias_attribute :user_id, :receiver_id

	enum status: {unanswered: 0, answered: 1}
	



	def self.save_email_message params, current_user

		receivers_ids = params[:email_message][:receiver_id].split.map{|i| i.to_i}
		receivers_ids.each do |receiver_id|

		email_message = EmailMessage.new
		email_message.subject = params[:email_message][:subject]
		email_message.text_message = params[:email_message][:text_message]
		email_message.product_id = params[:email_message][:product_id]
		email_message.receiver_id = receiver_id
		email_message.senter_id = current_user.id
		email_message.email_message_id = params[:email_message][:email_message_id]

		email_message.save!

		if email_message.email_message_id == nil
			email_message.update(email_message_id: email_message.id)
		end


		message_that_was_answered = EmailMessage.find_by(id: params[:email_message][:message_to_be_answered_id])
		if message_that_was_answered
			message_that_was_answered.update(status: 1)
		end

		receiver_user = User.find_by(id: receiver_id)
		EmailMessageMailer.email_message_confirmation(email_message,receiver_user).deliver


		end
	end

	def self.messages_received user
	
		@messages_received = []

		email_message_ids = EmailMessage.where(receiver_id: user.id).order(updated_at: :desc).pluck(:email_message_id).uniq
		email_message_ids.each do |email_message_id|
			email_message = EmailMessage.where(email_message_id: email_message_id).last
			@messages_received << email_message
		end
		@messages_received
		

	end
		
end
 