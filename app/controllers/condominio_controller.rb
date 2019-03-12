class CondominioController < ApplicationController
	layout 'condominio', :only => [:index]
	layout 'quem_somos', :only => [:quem_somos]
	layout 'falencias', :only => [:falencias]
  layout 'legal_finance', :only => [:legal_finance]  
  layout 'imobiliario', :only => [:imobiliario]
  layout 'advogados', :only => [:advogados]
  layout 'credores', :only => [:credores]
  layout 'devedores', :only => [:devedores]
  layout 'investidores', :only => [:devedores]
  layout 'npl', :only => [:npl]

	#skip_before_action :authenticate_user!, :only => [:index,:quem_somos, :falencias, :imobiliario, :legal_finance,:advogados, :credores, :devedores, :investidores, :npl]	

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

  def falencias
    respond_to do |format|
      format.html {render :layout => 'falencias'}
    end    
  end

  def legal_finance
    respond_to do |format|
      format.html {render :layout => 'legal_finance'}
    end    
  end


  def npl
    respond_to do |format|
      format.html {render :layout => 'npl'}
    end    
  end


  def imobiliario
    respond_to do |format|
      format.html {render :layout => 'imobiliario'}
    end    
  end

  def advogados
    respond_to do |format|
      format.html {render :layout => 'advogados'}
    end    
  end

  def credores
    respond_to do |format|
      format.html {render :layout => 'credores'}
    end    
  end

  def devedores
    respond_to do |format|
      format.html {render :layout => 'devedores'}
    end    
  end

  def investidores
    respond_to do |format|
      format.html {render :layout => 'investidores'}
    end    
  end



end
