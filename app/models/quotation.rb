class Quotation < ApplicationRecord
	
	#validates :senter_message, presence: true

	def save_quotation params, user

		category = Category.find_by(id: params[:quotation][:category_id])
		#receivers_ids = category.products.includes(:product_associates).pluck(:user_id)
		array_of_receivers_and_firm_ids = category.products.includes(:product_associates).pluck(:user_id, :firm_id)
		#monta uma array como o ID de cada product_associate com a firma que ele pertence

		r = Random.new_seed.to_s
		if Quotation.where(group_id: r).present? 
			r = Random.new_seed
		end

		array_of_receivers_and_firm_ids.each do |array_item| #|receiver_id|

			unless array_item.first == user.id #bloquea a criação de uma solicitação de cotação para ela mesma
				quotation = Quotation.new
				quotation.senter_id = user.id
				quotation.receiver_id = array_item.first #receiver_id
				quotation.senter_message = params[:quotation][:senter_message]
				quotation.category_id = params[:quotation][:category_id]
				quotation.group_id = r #Random.new_seed_to_s << receiver_id << receiver_id << params[:quotation][:senter_message] << params[:quotation][:category_id]
				quotation.firm_id = array_item.last

				quotation.save!
				#QuotationMailer.quote_requested_confirmation(user, quotation).deliver
			end
		end
		
	end


end
