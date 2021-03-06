class Coluna < ActiveRecord::Base
	has_many :artigos
	attr_accessible :tema, :resumo, :icone, :created_at, :updated_at, :name, :numero_de_artigos

	before_save :criar_slug

	def criar_slug
		self.slug = self.name.parameterize
	end

	def atualizar_numero_de_artigos
		self.update_attributes numero_de_artigos: self.artigos.count
	end

	def artigo_mais_recente
		artigos.order("created_at DESC").first
	end

	rails_admin do
		configure :icone do
			help "Procurar no projeto Font Awesome e escrever aqui. Ex: icon-facetime-video"
		end
	end

end