Rails.application.routes.draw do
  resources :products
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :stores
  root to: 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
