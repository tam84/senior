class ProductAssociatesController < ApplicationController
	def index
		
	end

	def new
		@users = User.all
		@product_associate = ProductAssociate.new
	end

	def create
		@product_associate = ProductAssociate.create(product_associate_params)
	end

	private

	def product_associate_params
		params.require(:product_associate).permit(:product_id, :user_id)
	end

	
end
