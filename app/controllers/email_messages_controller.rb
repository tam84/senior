class EmailMessagesController < ApplicationController

	def new
		@email_message = EmailMessage.new
		@messages_history = EmailMessage.where(email_message_id: params[:email_message_id]).order(updated_at: :desc)		
	end

	def create
		if EmailMessage.save_email_message params, current_user
			flash[:success] = "Mensagem enviada com sucesso"
		    redirect_back(fallback_location: root_path)
			#redirect_to product_path(id: params[:email_message][:product_id])
		else
			flash[:error] = "Não foi possível enviar a mensagem. Por favor tente novamente"
			redirect_back(fallback_location: root_path)			
			#redirect_to product_path(id: params[:email_message][:product_id])
		end		
	end

	def index
		@received_messages = EmailMessage.messages_received(current_user)

		if params[:notification_type]
			Notification.update_check_status current_user, params[:notification_type]
			@received_messages = EmailMessage.messages_received(current_user)
		end
		#@email_messages = current_user.email_messages
		#puts @messages.first.subject
	end

	def show

	end

end
 