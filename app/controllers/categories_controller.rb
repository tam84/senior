class CategoriesController < ApplicationController

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = "Categoria criada com sucesso"
  	end
  end

	private

	def category_params
    params.require(:category).permit(:name, :description, :assetclass_id)    		
	end


end
		

