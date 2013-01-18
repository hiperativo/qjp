Qjp::Application.routes.draw do
	mount Rich::Engine => '/rich', :as => 'rich'
	mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

	devise_for :users

	match "/blog" => "artigos#index"
	match "/assunto/:assunto" => "artigos#index"
	match "/autor/:author" => "artigos#index"
	match "/:coluna" => "artigos#index"
	match "/:coluna/:artigo" => "artigos#show"
	root :to => "pages#index"
end
