class Quotation < ApplicationRecord
	
	#validates :senter_message, presence: true

	enum status: {under_revision: 0, approved: 1}	

	def save_quotation params, user

		category = Category.find_by(id: params[:quotation][:category_id])
		product = category.products.first
		if product.product_associates.joins(:customer_to_product_associates).where("customer_to_product_associates.user_id = ?", user.id).present?
			full_array_of_receivers_and_firm_ids = product.product_associates.joins(:customer_to_product_associates, :user).where("customer_to_product_associates.user_id = ?", user.id).pluck(:user_id, :firm_id)				
		else
			current_user_segmentations = user.segmentation			
			full_array_of_receivers_and_firm_ids = product.product_associates.joins(:user).where("users.segmentation@> ARRAY[?]::varchar[]", current_user_segmentations).pluck(:user_id, :firm_id)	
		end	

		array_of_receivers_and_firm_ids = full_array_of_receivers_and_firm_ids.delete_if {|x| x.first == nil}


		r = Random.new_seed.to_s
		if Quotation.where(group_id: r).present? 
			r = Random.new_seed
		end

		quotation_product_id = 	category.products.first.id

		array_of_receivers_and_firm_ids.each do |array_item| #|receiver_id|

			unless array_item.first == user.id #bloquea a criação de uma solicitação de cotação para ela mesma
				quotation = Quotation.new
				quotation.senter_id = user.id
				quotation.receiver_id = array_item.first #receiver_id
				quotation.senter_message = params[:quotation][:senter_message]
				quotation.category_id = params[:quotation][:category_id]
				quotation.group_id = r #Random.new_seed_to_s << receiver_id << receiver_id << params[:quotation][:senter_message] << params[:quotation][:category_id]
				quotation.firm_id = array_item.last
				quotation.product_id = quotation_product_id

				quotation.save! 

				product_associates = ProductAssociate.where(user_id: quotation.receiver_id, product_id: quotation.product_id)
				for product_associate in product_associates
					CustomerToProductAssociate.find_or_create_by(user_id: user.id, product_associate_id: product_associate.id )		
				end


			end
		end
		
	end

	def confirm_request_quotation quotations, user
		for quotation in quotations
			quotation.update(status: "approved")

			receiver_user = User.find_by(id: quotation.receiver_id)
			quotation.notify_by_email receiver_user, user, quotation
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
