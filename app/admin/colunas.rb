ActiveAdmin.register Coluna do
	index do
		column :name
		column :tema
		column :resumo
		default_actions
	end
end