class LandingController < ApplicationController
	layout 'landing'
	#skip_before_action :authenticate_user!, :only => [:index]	

  def index

  end

  def preco_peito_silicone
  	render layout: "preco_peito_silicone"
  end

  def preco_antes_depois_rinoplastia
  	render layout: "preco_antes_depois_rinoplastia"
  end

  def preco_antes_depois_otoplastia
    render layout: "preco_antes_depois_otoplastia"
  end

  def preco_antes_depois_mastopexia
    render layout: "preco_antes_depois_mastopexia"
  end

  def antes_depois_preco_mamoplastia_redutora
    render layout: "antes_depois_preco_mamoplastia_redutora"
  end


end
