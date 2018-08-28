class UsersController < ApplicationController

  def index
	if params[:term]
  		@users = User.search_by_full_name(params[:term])
      	flash[:success] = "Busca feita com sucesso" 
	else
  		@users = User.all
	end
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@products = Product.all#.includes(:product_associates).where(product_associate.user_id = current_user.id)
  	@posts = current_user.posts
  end

end
		

