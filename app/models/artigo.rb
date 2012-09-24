class Artigo < ActiveRecord::Base
  belongs_to :coluna
  before_save :criar_slug

  mount_uploader :imagem, BannerDoPostUploader

  attr_accessible :assunto, :chamada, :resumo, :conteudo, :coluna_id, :imagem
	def criar_slug
		self.slug = self.chamada.parameterize
	end
end