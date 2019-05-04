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

  def index
    if params[:assetclass_id]
      current_assetclass = Assetclass.find_by(id: params[:assetclass_id])
      @articles = current_assetclass.product_articles
    else
      current_category = Category.find_by(id: params[:category_id])
      @articles = current_category.product_articles
      @products = current_category.products
    end
  end

  def show
    if params[:id]
      @product_article = ProductArticle.find_by(id: params[:id])
      current_category = Category.find_by(id: @product_article.category_id)      
      @articles = current_category.product_articles
      @products = current_category.products
    end
  end

  def edit
    @product_article = ProductArticle.find_by(id: params[:id])
  end

  def update
    @product_article = ProductArticle.find_by(id: params[:id])
    if @product_article.update(product_article_params)
      flash[:success] = "Produto atualizado com sucesso!"
      redirect_to product_article_path(@product_article)
    else
      flash[:erro] = "Não foi possível atualizar o produto. Por favor tente novamente"
      redirect_to product_article_path(@product_article)
    end

  end

	private

	def product_article_params
    params.require(:product_article).permit(:product_id, :title, :content, :assetclass_id, :category_id, images:[] )    		
	end


end
		

