class ArtigosController < ApplicationController
	layout "leitura"
	def show
		@leitura = "leitura"
		@artigo = Artigo.find_by_slug(params[:artigo])
	end
end
