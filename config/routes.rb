Mapadacultura::Application.routes.draw do
  devise_for :users

  resources :entidade_equipamentos do
    resources :questionario_basico_entidades, :path => 'questionario'
    resources :fotos, :controller => "fotos"

    collection do
      get 'entidades/',           :action => 'entidades'
      get 'equipamentos/',        :action => 'equipamentos'
      get 'view/entidade/:id',    :action => 'entidade'
      get 'view/equipamento/:id', :action => 'equipamento'
      get 'view/atividade/:id',   :action => 'atividade', :as => 'atividade'
      get 'apresenta/:id',        :action => 'apresenta', :as => 'apresenta'
      get 'publish/:id',          :action => 'publish',   :as => 'publish'
      get 'evaluate'
      get 'search'
    end
  end

  resources :tipos
  resources :tipo_entidades
  resources :tipo_equipamentos
  resources :atividades
  resources :users

  get '/estados/:sigla/cidades', :to => 'cidades#index'
  get '/cep/:cep', :to => 'application#cep'

  get "home/index"
  get "home/sobre"

  root :to => 'home#index'
end
