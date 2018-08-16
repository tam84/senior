class QuotationsController < ApplicationController
  def index
  	@quotations_as_seller = Quotation.where(receiver_id: current_user.id)
  	@quotations_as_customer = Quotation.where(senter_id: current_user.id)
    if params and params["/quotations"] and params["/quotations"]["search"]
      @quotations_searched= Quotation.where(senter_message: params["/quotations"]["search"], senter_id: current_user.id).order(updated_at: :desc)
    end
  end

  def new
  	@quotation = Quotation.new
  end

  def create
  	@quotation = Quotation.new
  	if @quotation.save_quotation params, current_user
      redirect_to quotations_path
    else
      redirect_to new_quotation_path(category_id: 1)
    end
  end

  def show
  	@quotation = Quotation.find_by(id: params[:id])
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end

  	@quotation = Quotation.find_by(id: params[:id])
  end

  def update
  	@quotation = Quotation.find_by(id: params[:id])


  	@quotation.update(quote: params[:quotation][:quote], receiver_message: params[:quotation][:receiver_message],category_id: params[:quotation][:category_id])
    redirect_to quotations_path

  end

end
