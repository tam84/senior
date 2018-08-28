module NotificationsHelper

	def email_message_notifications user
		notifications = user.notifications.where(notification_type: 1).count 
	end

	def quotation_notifications user
		quotations = user.notifications.where(notification_type: 2).count 
	end



end
