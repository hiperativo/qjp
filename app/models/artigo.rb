# encoding: utf-8
class Artigo < ActiveRecord::Base
	validates :chamada, 	presence: true
	validates :coluna, 		presence: true
	validates :assunto, 	presence: true
	validates :imagem, 		presence: true
	validates :resumo, 		presence: true
	validates :resumo, 		length: { maximum: 120 }
	validates :conteudo, 	presence: true
	validates :author_id, 	presence: true

	attr_accessible :assunto, :chamada, :resumo, :conteudo, :coluna_id, :imagem, :imagem_cache, :author_id

	belongs_to :coluna
	belongs_to :author
	before_save :criar_slug
	
	mount_uploader :imagem, BannerDoPostUploader

	def criar_slug
		self.slug = self.chamada.parameterize
	end

	rails_admin do
		weight 0
		configure :coluna, :belongs_to_association 
		configure :user, :belongs_to_association
		configure :author, :belongs_to_association
		
		configure :assunto, :string do
			help "Uma palavra que defina o foco desse artigo. Ex: Num artigo sobre o lançamento de uma prequel de sandman, seria apenas 'Sandman'"
		end
		
		configure :chamada, :string do 
			help "O título principal do artigo. Ex: Filme 'O Hobbit' chega nos cinemas em Janeiro de 2013."
		end
		
		configure :resumo, :text do
			help "Dê um gostinho desse artigo em no máximo 120 caracteres. Algo que chame atenção do leitor. Mais pra frente, isso será utilizado na integração com twitter"
		end

		configure :conteudo, :text do 
			help "Aqui vem finalmente sua matéria completa. Sintaxe: **negrito**, _itálico_, . item de lista (pule uma linha para cada), . Item de lista ordenada, links: \#{link_to 'Texto do link', 'http://um.site.aqui'}" 
		end

		configure :imagem, :carrierwave 

		edit do
			field :coluna
			field :chamada
			field :author
			field :assunto
			field :imagem
			field :resumo
			field :conteudo, :rich_editor do
				config insert_many: true
			end
			field :imagem
		end
	end

end