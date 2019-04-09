class LandingController < ApplicationController
	layout 'landing'
	#skip_before_action :authenticate_user!, :only => [:index]	

  def index

  end

  def preco_fertilizacao_in_vitro
  	render layout: "preco_fertilizacao_in_vitro"
  end

  def preco_inseminacao_artificial
  	render layout: "preco_inseminacao_artificial"
  end

  def preco_relacao_sexual_programada
    render layout: "preco_relacao_sexual_programada"
  end

  def preco_transferencia_de_embriao_congelado
    render layout: "preco_transferencia_de_embriao_congelado"
  end

  def preco_doacao_de_ovulos
    render layout: "preco_doacao_de_ovulos"
  end
 
  def preco_doacao_de_semen
    render layout: "preco_doacao_de_semen"
  end

  def preco_doacao_de_embriao
    render layout: "preco_doacao_de_embriao"
  end


  def preco_barriga_de_aluguel
    render layout: "preco_barriga_de_aluguel"
  end


  def preco_congelamento_de_ovulos
    render layout: "preco_congelamento_de_ovulos"
  end

  def preco_antes_depois_blefaroplastia
    render layout: "preco_antes_depois_blefaroplastia"
  end
  
  def preco_antes_depois_botox_toxina_botulinica
    render layout: "preco_antes_depois_botox_toxina_botulinica"
  end

  def preco_antes_depois_acido_hialuronico_preenchimento_facial
    render layout: "preco_antes_depois_acido_hialuronico_preenchimento_facial"
  end

  def preco_antes_depois_mentoplastia
    render layout: "preco_antes_depois_mentoplastia"
  end

  def preco_antes_depois_queloide
    render layout: "preco_antes_depois_queloide"
  end

  def preco_antes_depois_gluteoplastia
    render layout: "preco_antes_depois_gluteoplastia"
  end

  def preco_antes_depois_ginecomastia
    render layout: "preco_antes_depois_ginecomastia"
  end

end
