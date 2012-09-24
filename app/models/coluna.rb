class Coluna < ActiveRecord::Base
	has_many :artigos
	attr_accessible :tema, :resumo, :icone, :created_at, :updated_at, :nome, :name
end