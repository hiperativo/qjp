class ArtigosController < ApplicationController
  def show
  	@leitura = "leitura"
  	@artigo = Artigo.where(:slug => params[:artigo]).first
  end
end
