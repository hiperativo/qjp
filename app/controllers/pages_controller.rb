
class PagesController < ApplicationController
	def index
		@colunas = Coluna.where("numero_de_artigos > ?", 0).map do |c|
			[c, Time.now - c.artigos.order("created_at DESC").first.created_at]
		end
		
		@colunas = @colunas.sort_by { |c, ultima_postagem| ultima_postagem unless ultima_postagem.nil?}
		@colunas.map! { |c| c[0] }

		@videos = Video.order("created_at DESC")
		@main_video = @videos.first
	end
end
