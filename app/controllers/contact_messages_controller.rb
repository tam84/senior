class ContactMessagesController < ApplicationController
    skip_before_action :authenticate_user!  
  

  	def new
  		@contact_message = ContactMessage.new
  	end

  	def create
  		@contact_message = ContactMessage.new(contact_message_params)
  		if @contact_message.save
  			flash[:success] = "Mensagem enviada com sucesso. Nossa equipe irá procura-lo!"
        redirect_back(fallback_location: root_path)
  		end
  	end

	private

	def contact_message_params
    params.require(:contact_message).permit(:name, :email, :content, :firm, :contacts)    		
	end


end
		

