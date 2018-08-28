class ProductAssociatesController < ApplicationController
  before_action :authenticate_admin_user!, only: [:new,:create]

	def index
		
	end

	def new
		@users = User.all
		@product_associate = ProductAssociate.new
	end

	def create
		@product_associate = ProductAssociate.new(product_associate_params)
		if @product_associate.save
			flash[:success] = "Associado cadastrado com sucesso."
			redirect_to @product_associate.product
		else
			flash[:error] = "Não foi possivel cadastrar o associado. Por favor tente novamente."
			redirect_to users_paths
		end			
	end

	private

	def product_associate_params
		params.require(:product_associate).permit(:product_id, :user_id)
	end

	
end
