class Quotation < ApplicationRecord
	
	

	def save_quotation params, user

		category = Category.find_by(id: params[:quotation][:category_id])
		receivers_ids = category.products.includes(:product_associates).pluck(:user_id)

		r = Random.new_seed.to_s
		if Quotation.where(group_id: r).present? 
			r = Random.new_seed
		end

		receivers_ids.each do |receiver_id|

			quotation = Quotation.new
			quotation.senter_id = user.id
			quotation.receiver_id = receiver_id
			quotation.senter_message = params[:quotation][:senter_message]
			quotation.category_id = params[:quotation][:category_id]
			quotation.group_id = r #Random.new_seed_to_s << receiver_id << receiver_id << params[:quotation][:senter_message] << params[:quotation][:category_id]
			#quotation.firm_id = 

			quotation.save!
			QuotationMailer.quote_requested_confirmation(user, quotation).deliver
		end
		
	end


end
