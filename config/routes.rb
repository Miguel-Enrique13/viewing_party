Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :sessions, only: [:new, :create], as: "login", path: 'login'
  resources :sessions, only: :destroy, as: 'logout', path: 'logout'

  resources :users, only: [:index, :create], path: 'dashboard'
  resources :users, only: :new, path: 'register'
  resources :users, only: [:update, :edit, :destroy]

  resources :discover, only: :index

  resources :movies, only: :index
end
