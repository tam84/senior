class ProfilesController < ApplicationController
  #before_action :authenticate_admin_user!, only: [:new,:create]
  require 'will_paginate/array'



	def new
		@profile = Profile.new
	end

	def create 
    if current_user
      params_merged = profile_params.merge(user_id: current_user.id)        
    end    
		@profile = Profile.new(params_merged)
		if @profile.save
      flash[:success] = "Currículo salvo com sucesso!"
      redirect_to @profile		
		else
      flash[:error] = "Não foi possivel salvar o currículo, tente novamente!"
      render 'new'
		end
	end
 

	def index		
    if params[:category_id] == "1"
      @products = Product.where(category_id: params[:category_id])
    end
    if params[:category_id] != "1"
      @products = Product.where(category_id: params[:category_id])
      render "article_index"
    end

	end

	def show
		if params[:id]
			@profile = Profile.find_by(id: params[:id])
		end
	end


  def edit
      @profile = current_user.profiles.first or Profile.new
  end

  def update
    @profile = Profile.find_or_create_by(user_id: current_user.id)
    if @profile.update(profile_params) 
        flash[:success] = "Currículo salvo com sucesso!"
        redirect_to @profile    
      else
        flash[:error] = "Não foi possivel salvar o currículo, tente novamente!"
        render 'edit'
    end
  end



  def import
    Product.import(params[:file])
    flash[:success] = "Importação feita com sucesso"
    redirect_back(fallback_location: root_path) 

  end  


	private



	def profile_params
		params.require(:profile).permit(:room_number,:street_name,:street_number,:zip_code,:neighborhood,:city,:english_level,:spanish_level,:educational_level,:short_profile,:skill_tags,:age,:long_profile, videos:[], images:[],documents:[]
      )
	end




end
