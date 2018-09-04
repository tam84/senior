class QuotationsController < ApplicationController
  def index
    if params[:status] == "under_revision"
      group_id = Quotation.where(senter_id: current_user.id).last.group_id
      @quotations_under_revision = Quotation.where(senter_id: current_user.id, status: "under_revision", group_id: group_id).order(updated_at: :desc)   
      firm_ids = @quotations_under_revision.pluck(:firm_id).uniq 
      @firms = Firm.where(id: firm_ids)      

    elsif params and params["/quotations"] and params["/quotations"]["search"]
      @quotations_searched= Quotation.where(senter_message: params["/quotations"]["search"], senter_id: current_user.id, status: "approved").order(updated_at: :desc)

    elsif params[:notification_type]
      Notification.update_check_status current_user, params[:notification_type]
      @quotations_as_seller = Quotation.where(receiver_id: current_user.id, status: "approved").order(updated_at: :desc)
      @quotations_as_customer = Quotation.where(senter_id: current_user.id, status: "approved").order(updated_at: :desc)

    else
      @quotations_as_seller = Quotation.where(receiver_id: current_user.id, status: "approved").order(updated_at: :desc)    
  	  @quotations_as_customer = Quotation.where(senter_id: current_user.id, status: "approved").order(updated_at: :desc)
    end
  end

  def new
  	@quotation = Quotation.new
  end

  def create
  	@quotation = Quotation.new
  	if @quotation.save_quotation params, current_user
      flash[:success] = 'Pedido enviado com sucesso! Acompanhe o recebimento de cotações.' 
      redirect_to quotations_path(status: "under_revision")
    else
      flash[:error] = 'Não foi possível enviar o seu pedido. Por favor tente novamente!' 
      redirect_to = new_quotation_path(category_id: 1)
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
    if params[:status] == "under_revision" and params[:firm_id] and params[:group_id]
      quotations = Quotation.where(group_id: params[:group_id], firm_id: params[:firm_id])
      quotations.destroy_all
      redirect_to quotations_path(status: "under_revision")
    end

    if params[:status] == "to_be_approved" and params[:group_id]
      @quotations = Quotation.where(group_id: params[:group_id])
      for quotation in @quotations
        quotation.update(status: 1)
      end
      flash[:success] = 'Pedido enviado com sucesso! Acompanhe o recebimento de cotações.'         
      redirect_to quotations_path      
    end

    if params[:status] == "approved" and params[:quotations_ids]
      quotations_ids = params[:quotations_ids]
      @quotations = Quotation.where(id: [1,3,5])
      @quotations = Quotation.where(id: quotations_ids)
      @quotations.confirm_request_quotation @quotations, current_user
    end

    if !params[:status] == "under_revision" and !params[:firm_id] and !params[:group_id]    

  	 @quotation = Quotation.find_by(id: params[:id])

  	 if @quotation.update(quote: params[:quotation][:quote], receiver_message: params[:quotation][:receiver_message],category_id: params[:quotation][:category_id])
        flash[:success] = 'Cotação enviada ao cliente' 
        redirect_to quotations_path
      else
        flash[:error] = 'Não foi possível enviar a cotação ao cliente. Por favor tente novamente' 
        redirect_to quotations_path      
      end
    end
  end


end
