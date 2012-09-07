ActiveAdmin.register Artigo do
	index :as => :blog do
		title :chamada
		body do |post|
			div "#{post.coluna.tema} - #{post.resumo}"
		end
	end
end
