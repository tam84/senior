class EventsController < ApplicationController
    #skip_before_action :authenticate_user!  
  

  	def new
  		@event = Event.new
  	end

  	def create
  		@event = Event.new(event_params)
  		if @event.save
  			flash[:success] = "Cadastro feito com sucesso!"
        redirect_back(fallback_location: root_path)
  		end
  	end

	private

	def event_params
    params.require(:event).permit(:name, :email, :content, :description, :contacts)    		
	end


end
		

