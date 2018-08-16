class EmailMessagesController < ApplicationController

	def new
		@email_message = EmailMessage.new
	end

	def create
		
		EmailMessage.save_email_message params, current_user

		#@message_member = MessageMember.save_members params, current_user, @message			
		
	end

	def index
		@received_messages = EmailMessage.messages_received current_user
		#@email_messages = current_user.email_messages
		#puts @messages.first.subject
	end

	def show

	end

end
 