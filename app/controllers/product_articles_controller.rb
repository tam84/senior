class ProductArticlesController < ApplicationController
  #before_action :authenticate_admin_user!
  

  def new
  	@product_article = ProductArticle.new
    @users = User.all
  end

  def create
  	@product_article = ProductArticle.new(product_article_params)
  	if @product_article.save
  		flash[:success] = "Associação feita com sucesso"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Algo deu errado. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    if params[:id]
      @product_article = ProductArticle.find_by(id: params[:id])
    end
  end

	private

	def product_article_params
    params.require(:product_article).permit(:product_id, :title, :content)    		
	end


end
		

