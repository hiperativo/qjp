class PagesController < ApplicationController
  def index
  	@colunas = Coluna.all
  	@videos = Video.all
  	@main_video = @videos.first
  end

end
