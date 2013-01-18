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
	before_save :criar_slugs

	after_create :aumentar_numero_de_artigos_nas_colunas
	after_destroy :diminuir_numero_de_artigos_nas_colunas

	def aumentar_numero_de_artigos_nas_colunas
		atualizar_numero_de_artigos_nas_colunas 1
	end

	def diminuir_numero_de_artigos_nas_colunas
		atualizar_numero_de_artigos_nas_colunas -1
	end

	def atualizar_numero_de_artigos_nas_colunas x
		self.coluna.numero_de_artigos += x
		self.coluna.save
	end
	
	mount_uploader :imagem, BannerDoPostUploader

	def novo?
		created_at.strftime("%d/%m/%y") == Time.now.strftime("%d/%m/%y")
	end

	def criar_slugs
		self.slug = self.chamada.parameterize
		self.assunto_slug = self.assunto.parameterize
	end

	def postado_quando?(verbo="postado")
		if self.criado_ha_quantos_dias? < 7
			output = "#{verbo} <strong>#{ I18n.l self.created_at, format: '%A' }</strong>"
		else 
			output = "#{verbo} há <strong>#{ self.criado_ha_quantos_dias?}</strong> dias atrás"
		end
		output.html_safe
	end

	def criado_ha_quantos_dias?
		(Time.now - self.created_at).divmod(60*60*24)[0]
	end

	def a_que_horas?
		horas_24 = I18n.l(self.created_at, format: '%k').to_i
		horas_12 = I18n.l(self.created_at, format: '%l').to_i

		case horas_24.to_i
			when 0 then output = "à <strong>meia-noite</strong>"
			when 12 then output = "ao <strong>meio-dia</strong>"
		else
			periodo = case horas_24
				when 4..11 then "da manhã"
				when 13..18 then "da tarde"
				when 19..23 then "da noite"
				when 0..3 then "da madrugada, (insônia é foda)"
				else ""
			end

			output = "às <strong>#{ horas_12 } #{periodo}</strong>"

		end
		output.html_safe
	end

	rails_admin do
		# weight 0
		# configure :coluna, :belongs_to_association 
		# configure :user, :belongs_to_association
		# configure :author, :belongs_to_association
		
		# configure :assunto, :string do
		# 	help "Uma palavra que defina o foco desse artigo. Ex: Num artigo sobre o lançamento de uma prequel de sandman, seria apenas 'Sandman'"
		# end
		
		# configure :chamada, :string do 
		# 	help "O título principal do artigo. Ex: Filme 'O Hobbit' chega nos cinemas em Janeiro de 2013."
		# end
		
		# configure :resumo, :text do
		# 	help "Dê um gostinho desse artigo em no máximo 120 caracteres. Algo que chame atenção do leitor. Mais pra frente, isso será utilizado na integração com twitter"
		# end

		# configure :conteudo, :text do 
		# 	help "Aqui vem finalmente sua matéria completa. Sintaxe: **negrito**, _itálico_, . item de lista (pule uma linha para cada), . Item de lista ordenada, links: \#{link_to 'Texto do link', 'http://um.site.aqui'}" 
		# end

		# configure :imagem, :carrierwave 

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