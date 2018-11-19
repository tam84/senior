class ConnectionsController < ApplicationController

	def new
    	@connection = Connection.new
	end


  def create
    params_merged = connection_params.merge(user_id: current_user.id)
    @connection = Connection.find_or_initialize_by(params_merged)
    if @connection.save
      flash[:success] = "Você agora é um seguidor e as atualizações aparecerão no seu Feed"
      redirect_back(fallback_location: root_path)
    else
      flash[:erro] = "Não foi possível criar essa conexão. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @connection = Connection.find_by(id: params[:id])
    if @connection.destroy
      flash[:success] = "Você deixou de seguir esse produto e não receberá mais atualizações sobre ele em seu feed. Caso queira voltar a seguir clique em Seguir "
      redirect_back(fallback_location: root_path)
    else
      flash[:erro] = "Não foi possível criar essa conexão. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end      
  end

  private

  def connection_params
    params.require(:connection).permit(:followed_id, :followed_type)    
  end  	

end
		

