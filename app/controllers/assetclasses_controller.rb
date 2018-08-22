class AssetclassesController < ApplicationController

  	def new
  		@assetclass = Assetclass.new
  	end

  	def create
  		@assetclass = Assetclass.new(assetclass_params)
  		if @assetclass.save
  			flash[:success] = "Classe de ativo criada com sucesso"
  		end
  	end

	private

	def assetclass_params
    params.require(:assetclass).permit(:name, :description)    		
	end


end
		

