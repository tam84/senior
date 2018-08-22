class MessageAnswersController < ApplicationController

	def new
		@message_answer = MessageAnswer.new
		@messages_history = MessageAnswer.where(email_message_id: params[:email_message_id]).order(updated_at: :desc)
	end
 
	def create
		message_answer_senter_id = current_user.id
		params_merged = message_answer_params.merge(senter_id: message_answer_senter_id, receiver_id: params[:message_answer][:senter_id])
		@message_answer = MessageAnswer.new(params_merged)
		if @message_answer.save
			flash[:success] = "Mensagem enviada com sucesso"
			redirect_to email_messages_path
		else
			flash[:error] = "Não foi possível enviar a mensagem. Por favor tente novamente"
			redirect_to email_messages_path
		end
	end



	private

	def message_answer_params
    params.require(:message_answer).permit(:receiver_id, :product_id, :email_message_id, :subject, :text_message)    		
	end

end		
