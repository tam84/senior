class LandingController < ApplicationController
	layout 'landing'
	skip_before_action :authenticate_user!, :only => [:index]	

  def index

  end
end
