Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  resources :sessions, only: [:new, :create], as: "login"
  resources :sessions, only: :destroy, as: 'logout'

  resources :users, only: [:index, :create], path: 'profile'
  resources :users, only: :new, path: 'register'
  resources :users, only: [:update, :edit, :destroy]
end
