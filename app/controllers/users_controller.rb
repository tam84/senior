class UsersController < ApplicationController

  def index
	if params[:term]
  		@users = User.search_by_full_name(params[:term])
      	flash[:success] = "Busca feita com sucesso" 
	else
  		@users = User.all
	end
  end

end
		

