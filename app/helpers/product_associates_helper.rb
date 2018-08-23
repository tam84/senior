module ProductAssociatesHelper
	def user_name product_associate
		user = User.find_by(id: product_associate.user_id).name
	end

	def user_description product_associate
		user = User.find_by(id: product_associate.user_id).description
	end	

	def user_job_title product_associate
		user = User.find_by(id: product_associate.user_id).job_title
	end		

	def user_profile_photo product_associate
		user = User.find_by(id: product_associate.user_id).profile_photos.first
	end

	def start_chat
		
	end
end
