Qjp::Application.routes.draw do
  match "/:coluna/:artigo" => "artigos#show"
  root :to => "pages#index"
end
