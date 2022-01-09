Rails.application.routes.draw do
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end
  root to: 'splash#index'

  devise_for :users
  
  resources :activities

  resources :categories
  get 'welcome', to: 'splash#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
