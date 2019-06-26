class CasasDeRepousosController < ApplicationController
  before_action :set_casas_de_repouso, only: [:show, :edit, :update, :destroy]

  # GET /casas_de_repousos
  # GET /casas_de_repousos.json
  def index
    @casas_de_repousos = CasasDeRepouso.all
  end

  # GET /casas_de_repousos/1
  # GET /casas_de_repousos/1.json
  def show
  end

  # GET /casas_de_repousos/new
  def new
    @casas_de_repouso = CasasDeRepouso.new
  end

  # GET /casas_de_repousos/1/edit
  def edit
  end

  # POST /casas_de_repousos
  # POST /casas_de_repousos.json
  def create
    @casas_de_repouso = CasasDeRepouso.new(casas_de_repouso_params)

    respond_to do |format|
      if @casas_de_repouso.save
        format.html { redirect_to @casas_de_repouso, notice: 'Casas de repouso was successfully created.' }
        format.json { render :show, status: :created, location: @casas_de_repouso }
      else
        format.html { render :new }
        format.json { render json: @casas_de_repouso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casas_de_repousos/1
  # PATCH/PUT /casas_de_repousos/1.json
  def update
    respond_to do |format|
      if @casas_de_repouso.update(casas_de_repouso_params)
        format.html { redirect_to @casas_de_repouso, notice: 'Casas de repouso was successfully updated.' }
        format.json { render :show, status: :ok, location: @casas_de_repouso }
      else
        format.html { render :edit }
        format.json { render json: @casas_de_repouso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casas_de_repousos/1
  # DELETE /casas_de_repousos/1.json
  def destroy
    @casas_de_repouso.destroy
    respond_to do |format|
      format.html { redirect_to casas_de_repousos_url, notice: 'Casas de repouso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casas_de_repouso
      @casas_de_repouso = CasasDeRepouso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def casas_de_repouso_params
      params.require(:casas_de_repouso).permit(:endereco, :city, :bairro, :name, :sobre, :horario, :outras_informacoes, :preco, :telefones, :website ,:zona, equipe: [], instalacao: [], images: [])
    end
end
