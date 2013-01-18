# encoding: utf-8
class ArtigosController < ApplicationController
	layout "leitura"
	def show
		@artigos = Artigo.where slug: params[:artigo]
		@artigo = Artigo.find_by_slug params[:artigo]
		@title = @artigo.assunto
		@description = @artigo.resumo
	end

	def index
		if !params[:coluna].nil?
			@coluna = Coluna.find_by_slug params[:coluna] 
			@artigos = @coluna.artigos.order("created_at DESC")
			@title = @coluna.name
			@description = @coluna.resumo

			@visualizando = "Posts da coluna #{@title}"

		elsif !params[:assunto].nil?
			@artigos = Artigo.where(assunto_slug: params[:assunto]).order("created_at DESC")
			@title = params[:assunto]
			@description = "Revolução no entretenimento nerd"
		
			@visualizando = "Posts falando sobre #{@artigos.first.assunto}"

		else
			@artigos = Artigo.order("created_at DESC")
			@title = "Blog"
			@description = "Revolução no entretenimento nerd"

		end
	end
end
