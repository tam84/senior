class CondominioController < ApplicationController
	layout 'condominio', :only => [:index]
	layout 'quem_somos', :only => [:quem_somos]
	layout 'antecipacao', :only => [:antecipacao]
  layout 'inadimplencia', :only => [:inadimplencia]  
  layout 'garantido', :only => [:garantido]
  layout 'para_imobiliarias', :only => [:para_imobiliarias]
  layout 'para_proprietarios', :only => [:para_proprietarios]

	skip_before_action :authenticate_user!, :only => [:index,:quem_somos, :antecipacao, :garantido, :inadimplencia,:para_imobiliarias, :para_proprietarios]	

  def index
    respond_to do |format|
      format.html {render :layout => 'condominio'}
    end    
  end

  def quem_somos
    respond_to do |format|
      format.html {render :layout => 'quem_somos'}
    end
  end

  def antecipacao
    respond_to do |format|
      format.html {render :layout => 'antecipacao'}
    end    
  end

  def inadimplencia
    respond_to do |format|
      format.html {render :layout => 'inadimplencia'}
    end    
  end


  def garantido
    respond_to do |format|
      format.html {render :layout => 'garantido'}
    end    
  end

  def para_imobiliarias
    respond_to do |format|
      format.html {render :layout => 'para_imobiliarias'}
    end    
  end

  def para_proprietarios
    respond_to do |format|
      format.html {render :layout => 'para_proprietarios'}
    end    
  end

end
