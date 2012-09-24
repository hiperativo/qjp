# encoding: utf-8
FactoryGirl.define do
	factory :coluna do
		tema "Testes"
		resumo "Apenas um resumo"
		name "Testando colunas com o pedro"
	end

	factory :artigo do
		assunto "teste"
		chamada "lets go test?"
		resumo "testing is really cool"
		conteudo "I really love testing. Why? Because it rocks!"
	end

	factory :admin, :class => AdminUser do
		login "admin"
		password "imadmin"
		password_confirmation "imadmin"
	end
end