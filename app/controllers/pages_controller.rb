class PagesController < ApplicationController
	def index
		@colunas = Coluna.includes(:artigos).map do |c|
			[c, Time.now - c.artigos.order("created_at ASC").first.created_at ]
		end
		@colunas = @colunas.sort_by { |c, ultima_postagem| ultima_postagem }
		@colunas = @colunas.map { |c| c[0]}

		@videos = Video.order("created_at DESC")
		@main_video = @videos.first
	end
end
