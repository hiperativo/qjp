Qjp::Application.routes.draw do
  mount Rich::Engine => '/rich', :as => 'rich'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

	match "/:coluna" => "coluna#show"
	match "/:coluna/:artigo" => "artigos#show"
	root :to => "pages#index"
end
