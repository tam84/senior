module ConnectionsHelper


	def current_connection user, product, type
		current_connection = user.connections.where(followed_id: product.id, followed_type: type).first
	end

end
