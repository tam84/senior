class ProductsController < ApplicationController
  #before_action :authenticate_admin_user!, only: [:new,:create]
  require 'will_paginate/array'


	def new
		@product = Product.new
	end

	def create 
    if params[:product][:category_id].present? and params[:product][:firm_id].present?
		  assetclass_id = Category.find_by(id: params[:product][:category_id]).assetclass_id
      if product_params[:management_firm] == ""
        params_merged = product_params.merge(assetclass_id: assetclass_id, management_firm: "confidencial")        
      else
		    params_merged = product_params.merge(assetclass_id: assetclass_id, user_id: User.first.id)
      end
    end
		@product = Product.new(params_merged)
		if @product.save
      		flash[:success] = "Produto criado com sucesso!"
      		redirect_to @product		
		else
      		flash[:error] = "Não foi possivel criar o produto, tente novamente!"
          render 'new'
		end
	end


	def index		
    if params and params[:category_id]
      @products = Product.where(category_id: params[:category_id])
    elsif params and params[:assetclass_id]
      @products = Product.where(assetclass_id: params[:assetclass_id])      
    elsif params and params[:product] and params[:product][:city] and params[:product][:category_id]
      @products = Product.where(city: params[:product][:city].to_s, category_id: params[:product][:category_id])
    else
      @products = Product.all      
    end
	end

	def show
		if params[:id]
			@product = Product.find_by(id: params[:id])	
		end
    current_category = @product.category
    @articles = current_category.product_articles
    @products = current_category.products
	end


  def edit
    if params[:total_investment]
      @product = Product.find_by(id: params[:id])      
      render "edit_total_investment"
    else    
      @product = Product.find_by(id: params[:id])
      render 'edit'
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      flash[:success] = "Produto atualizado com sucesso!"
      redirect_to product_path(@product)
    else
      flash[:erro] = "Não foi possível atualizar o produto. Por favor tente novamente"
      redirect_to product_path(@product)
    end

    if params[:total_investment]
      @product = Product.find_by(id: params[:id])
      last_total_investment = @product.total_investment
      if @product.update(total_investment: last_total_investment - params[:total_investment])
        flash[:success] = "Produto atualizado com sucesso!"
        redirect_back(fallback_location: root_path)              
      end
    end
  end	

  def import
    Product.import(params[:file])
    flash[:success] = "Importação feita com sucesso"
    redirect_back(fallback_location: root_path) 

  end  


	private



	def product_params
		params.require(:product).permit(:requirement,:room_number, :street_name,:street_number,:zip_code,:neighborhood,:city,:english_level,:spanish_level,:educational_level,:skill_tags,:age,:view_status ,:name, :description, :category_id, :assetclass_id, :firm_id, :other_obs, :target_return_benchmark_from, :target_return_benchmark_to, :destribuitor, :inception_date, :management_firm,:to_investment_period ,videos:[], images:[], releases:[], documents:[], 
		
			)
	end

 


end
