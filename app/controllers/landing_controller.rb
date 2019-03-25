class LandingController < ApplicationController
	layout 'landing'
	#skip_before_action :authenticate_user!, :only => [:index]	

  def index

  end

  def preco_peito_silicone
  	render layout: "preco_peito_silicone"
  end


end
