class Notification < ApplicationRecord
	belongs_to :user


	enum check_status: {unchecked: 0, checked: 1}	
	enum answer_status: {undone: 0, done: 1}	
	enum notification_type: {email_message_notification: 1, quotation_notification: 2}


	def self.create_notification *args

		notification = Notification.new
		notification.notification_type = args.first[:notification_type]
		notification.user_id = args.first[:user_id]

		notification.save
	end

	def self.update_check_status user, notification_type
		#print "--------------------------hhhhhhhh-----------------------"
		#print params
		notifications = user.notifications.where(notification_type: notification_type)
		for notification in notifications
			notification.update(check_status: 1)
		end
	end





end
