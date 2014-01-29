SingleMalt::Application.routes.draw do
  root to: 'things#index'

  devise_for :users, only: [:sessions], path: '', path_names: { sign_in: 'login' }

  resources :experiences, only: [:index]

  resources :things, only: [:index] do
    get 'page/:page', action: :index, on: :collection
  end

  namespace :manage do
    resources :experiences, only: [:create, :new]
    resources :things, only: [:create, :new]
  end
end
