SingleMalt::Application.routes.draw do
  root to: 'things#index'

  resources :experiences, only: [:index]
  resources :things, only: [:index]

  namespace :manage do
    resources :things, only: [:create, :new]
  end
end
