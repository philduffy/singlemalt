SingleMalt::Application.routes.draw do
  root to: 'things#index'

  devise_for :users, only: [:sessions], path: '', path_names: { sign_in: 'login' }

  resources :experiences, only: [:index]

  resources :things, only: [:index, :show] do
    get 'page/:page', action: :index, on: :collection
  end

  namespace :manage do
    resources :experiences, only: [:create, :new]
    resources :things, except: :destroy
  end

  get 'feed', to: 'things#index', defaults: { format: 'atom' }, as: 'feed'
end
