ActiveAdmin.register Artigo do
	index :as => :blog do
		title :chamada
		body do |post|
			"#{post.coluna.tema} - #{post.resumo}" unless post.blank? || post.coluna.blank?
		end
	end

	form do |f|
		f.inputs do
			f.input :assunto
			f.input :chamada
			f.input :resumo
			f.input :conteudo
			f.input :coluna
			f.input :imagem, :as => :file
		end
		f.buttons
	end
end
