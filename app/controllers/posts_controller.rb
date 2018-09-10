class PostsController < ApplicationController
  
  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post feito com sucesso"
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = "Não foi possível fazer o post. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end

  end

  def index
    #if params[:product_id]
    #  @product = Product.find_by(id: params[:product_id])
    #  @posts = @product.posts
    #end
    if params[:postable_type]
      @posts = Post.where(postable_type: params[:postable_type], postable_id: params[:postable_id])
    else
      array = current_user.connections.pluck(:followed_id, :followed_type)
      postable_ids = array.map {|el| el[0]}
      postable_types = array.map {|el| el[1]}
      @posts = Post.where(postable_id: postable_ids, postable_type: postable_types )
    end

  end

  private

  def post_params
    params.require(:post).permit(:content, :postable_id, :postable_type)    
  end


end
