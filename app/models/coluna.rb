class Coluna < ActiveRecord::Base
	has_many :artigos
	attr_accessible :tema, :resumo, :icone, :created_at, :updated_at, :name


	rails_admin do
		configure :icone do
			help "Procurar no projeto Font Awesome e escrever aqui. Ex: icon-facetime-video"
		end
	end

end