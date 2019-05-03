class Quotation < ApplicationRecord
	
	enum status: {under_revision: 0, approved: 1}	


	def save_quotation params, user 

		product = Product.find_by(id: params[:quotation][:product_id])
		category = product.category


		r = Random.new_seed.to_s
		if Quotation.where(group_id: r).present? 
			r = Random.new_seed
		end


		quotation = Quotation.new
		quotation.senter_id = user.id
		quotation.receiver_id = product.user_id
		quotation.senter_message = params[:quotation][:senter_message]
		quotation.category_id = category.id
		quotation.group_id = r #Random.new_seed_to_s << receiver_id << receiver_id << params[:quotation][:senter_message] << params[:quotation][:category_id]
		quotation.firm_id = product.firm_id
		quotation.product_id = product.id

		quotation.save! 
		
	end

	def confirm_request_quotation quotations, user
		for quotation in quotations
			quotation.update(status: "approved")

			receiver_user = User.find_by(id: quotation.receiver_id)
			#quotation.notify_by_email receiver_user, user, quotation
			quotation.notify_by_notification quotation.receiver_id
		end
	end

	def notify_by_email receiver_user, user, quotation
		QuotationMailer.quote_requested_confirmation(receiver_user, user, quotation).deliver	
	end

	def notify_by_notification receiver_id
		Notification.create_notification user_id: receiver_id, notification_type: 2
	end


end
