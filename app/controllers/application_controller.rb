class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?
#	before_filter :configure_permitted_parameters, if: :devise_controller?





  	protected

  	def configure_permitted_parameters
    	attributes = [:name, :surname,:username, :email, :full_name, :description, :whatsapp, :skype, :linkedin, :facebook, :instagram, :website, :firm_phone, :official_registration, :address, :firm_id, :zip_code, :segmentation, documents:[], profile_photos:[]]
    	devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    	devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  	end


	def authenticate_admin_user!
    	unless current_user == User.first
      		flash[:error] = "Você não tem autorização para acessar essa página"
      		redirect_to email_messages_path # halts request cycle
    	end
    end
  	
end
