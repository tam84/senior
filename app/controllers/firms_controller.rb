class FirmsController < ApplicationController
  before_action :authenticate_admin_user!
  
  
  def new
    @firm = Firm.new
    @youtube_video = YoutubeVideo.new
  end

  def create
    @firm = Firm.new(firm_params)
      if @firm.save
        flash[:success] = "Empresa criada com sucesso!"
        redirect_to firms_path
      else
        flash[:erro] = "Não foi possível criar a empresa. Por favor tente novamente"
        redirect_to new_firm_path
      end
  end

  def index
    if params[:term]
      @firms = Firm.search_by_name(params[:term])
    else
      @firms = Firm.all
    end
  end


  def show
    @firm = Firm.find_by(id: params[:id])
    @users = User.all
    @products = Product.all#.includes(:product_associates).where(product_associate.user_id = current_user.id)
    @posts = Post.all

  end

  def edit
    @firm = Firm.find_by(id: params[:id])
  end

  def update
    @firm = Firm.find_by(id: params[:id])
    if @firm.update(firm_params)
      flash[:success] = "Perfil da empresa atualizado com sucesso!"
      redirect_to firms_path
    else
      flash[:erro] = "Não foi possível atualizar o perfil da empresa. Por favor tente novamente"
      redirect_to new_firm_path
    end
  end


  private

  def firm_params
    params.require(:firm).permit(:name, :description, :email, :whatsapp, :skype, :linkedin, :facebook, :instagram, :firm_phone, :website, :cnpj, :address, documents:[], firm_photos:[], releases:[], videos:[]
      )    
  end


end
