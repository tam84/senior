module QuotationsHelper

	def customer_name quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_name = user.name
	end

	def options_for_senter_message 
		senter_messages = Quotation.pluck(:senter_message)
		uniq_senter_messages = senter_messages.uniq
	end

	def current_user_has_quotations_as_seller
		@quotation = Quotation.where(receiver_id: current_user.id, status: 1).count > 0 
	end

	def current_user_has_quotations_as_customer
		@quotation = Quotation.where(senter_id: current_user.id, status: 1).count > 0
	end

	def firm_name quotation
		user = User.find_by(id: quotation.receiver_id)
		if user
			user_name = user.firm_name user
		else
			user_name = nil
		end
	end


end
