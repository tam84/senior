class CustomerToBankersController < ApplicationController


  def new
    @customer_to_banker = CustomerToBanker.new
  end

  def create
    @customer_to_banker = CustomerToBanker.new(customer_to_bankers_params)
    if @customer_to_banker.save
      quotation = Quotation.find_by(id: customer_to_bankers_params[:quotation_id])
      quotation.destroy
      flash[:success] = "Você não receberá mais pedidos de cotação desse cliente"
      redirect_back(fallback_location: root_path)
    else
      flash[:erro] = "Não foi possível efetuar essa ação. Por favor tente novamente"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def customer_to_bankers_params
    params.require(:customer_to_banker).permit(:user_id, :banker_id, :product_id, :firm_id, :quotation_id)    
  end  	

end
		

