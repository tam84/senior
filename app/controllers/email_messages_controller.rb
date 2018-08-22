class EmailMessagesController < ApplicationController

	def new
		@email_message = EmailMessage.new
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
		@received_messages = EmailMessage.messages_received current_user
		#@email_messages = current_user.email_messages
		#puts @messages.first.subject
	end

	def show

	end

end
 