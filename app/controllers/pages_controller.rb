class PagesController < ApplicationController
  def index
  	@colunas = Coluna.all
  	@videos = Video.order("created_at DESC")
  	@main_video = @videos.first
  end

end
