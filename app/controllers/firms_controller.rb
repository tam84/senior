class FirmsController < ApplicationController
  def new
    @firm = Firm.new
  end

  def create
    @firm = Firm.create(firm_params)
  end

  def index
  if params[:term]
      @firms = Firm.search_by_name(params[:term])
  else
      @firms = Firm.all
  end

  end

  def show
  end

  def edit
  end

  def update
  end


  private

  def firm_params
    params.require(:firm).permit(:name, :description, :email, :whatsapp, :skype, :linkedin, :facebook, :instagram, :firm_phone, :website, :cnpj, :address, firm_photos:[]
      )    
  end


end
