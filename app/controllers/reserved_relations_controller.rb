class ReservedRelationsController < ApplicationController
  before_action :authenticate_admin_user!
  

  def new
  	@reserved_relation = ReservedRelation.new
    @users = User.all
  end

  def create
  	@reserved_relation = ReservedRelation.new(reserved_relation_params)
  	if @reserved_relation.save
  		flash[:success] = "Associação feita com sucesso"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Algo deu errado. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end

  end

	private

	def reserved_relation_params
    params.require(:reserved_relation).permit(:product_id, :user_id)    		
	end


end
		

