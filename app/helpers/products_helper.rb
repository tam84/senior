module ProductsHelper

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
		@quotation = Quotation.where(receiver_id: current_user.id).count > 0 
	end

	def current_user_has_quotations_as_customer
		@quotation = Quotation.where(senter_id: current_user.id).count > 0
	end

	def category_options products
		categories_id = products.includes(:category).pluck(:category_id).uniq
		array = []
		categories_id.each do |category_id|
			category_name = Category.find_by(id: category_id).name
			array << category_name
		end
		array
	end


end
