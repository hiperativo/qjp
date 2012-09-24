require 'spec_helper'

describe "Articles" do
	# it "should show the columns" do
	# 	coluna = FactoryGirl.create :coluna
	# 	visit root_url
	# 	has_content? coluna.name
	# end

	it "should upload an article icon", do
		DatabaseCleaner.clean
		coluna = FactoryGirl.build :coluna
		print coluna.save!
		print coluna.name
		artigo = FactoryGirl.create :artigo
		admin = FactoryGirl.create :admin

		visit "/admin"
		fill_in "Login", :with => admin.login
		fill_in "Password", :with => admin.password
		click_button "Login"
		page.should have_content "Dashboard"
		click_link "Artigos"
		click_on "New Artigo"
		fill_in "Assunto", 		:with => artigo.assunto
		fill_in "Chamada", 		:with => artigo.chamada
		fill_in "Resumo", 		:with => artigo.resumo
		fill_in "Conteudo", 	:with => artigo.conteudo
		select coluna.name, 	:from => "Coluna"
		attach_file "Imagem", "/Users/pedrozath/Desktop/marte.jpg"
		click_button "Create Artigo"
	end

end