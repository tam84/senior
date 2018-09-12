class TutorialsController < ApplicationController
  before_action :authenticate_admin_user!
  

  	def request_tutorial
  		render 'request_tutorial'
  	end



end
		

