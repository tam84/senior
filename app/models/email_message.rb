class EmailMessage < ApplicationRecord
	belongs_to :product, optional: true
	#has_many :message_members
	#belongs_to :user
	alias_attribute :user_id, :receiver_id
	has_many :message_answers



	def self.save_email_message params, current_user

		#receivers_ids = params[:email_message][:email_message_members][:receiver_id].split.map{|i| i.to_i}
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

		EmailMessageMailer.email_message_confirmation(email_message,current_user).deliver

		end
	end

	def self.messages_received user
		email_messages = EmailMessage.where(receiver_id: user.id).order(updated_at: :desc).includes(:product)
		message_answers = MessageAnswer.where(receiver_id: user.id).order(updated_at: :desc)
		@messages_received = message_answers + email_messages 
	end
		
end
 