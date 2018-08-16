class MessageAnswersController < ApplicationController

	def new
		@message_answer = MessageAnswer.new
		@messages_history = MessageAnswer.where(email_message_id: params[:email_message_id]).order(updated_at: :desc)
	end

	def create
		@message_answer = MessageAnswer.new
		@message_answer.save_answer @message_answer, params, current_user
	end


end


3004-1000