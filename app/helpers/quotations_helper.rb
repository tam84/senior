module QuotationsHelper


	def candidate_profile quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_profile = user.profiles.first
	end

	def candidate quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
	end

	def candidate_name quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_name = user.full_name
	end


	def candidate_resume quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_resume = user.profiles.first.documents.first
	end


	def candidate_age quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_age = user.profiles.first.age
	end


	def candidate_location quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_neighborhood = user.profiles.first.neighborhood
		user_city = user.profiles.first.city
		user_location = user_neighborhood + " - " + user_city
	end


	def candidate_short_profile quotation
		quotation_senter_id = quotation.senter_id
		user = User.find_by(id: quotation_senter_id)
		user_resume = user.profiles.first.short_profile
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

	#def firm_name quotation
	#	user = User.find_by(id: quotation.receiver_id)
	#	if user
	#		user_name = user.firm_name user
	#	else
	#		user_name = nil
	#	end
	#end


end
