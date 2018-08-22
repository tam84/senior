class ApplicationController < ActionController::Base
	before_action :authenticate_user!

#	before_action :configure_permitted_parameters, if: :devise_controller?
	before_filter :configure_permitted_parameters, if: :devise_controller?


  	protected

  	def configure_permitted_parameters
    	attributes = [:name, :surname,:username, :email, :full_name, :description, :whatsapp, :skype, :linkedin, :facebook, :instagram, :website, :firm_phone, :official_registration, :address, :firm_id, profile_photos:[]]
    	devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    	devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  	end
end
