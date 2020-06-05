Rails.application.routes.draw do
  resources :products
  root to: 'home#index'
  get 'home/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :stores, controllers: {
      sessions: 'store/sessions',
      registrations: 'store/registrations'
  }

  match "*a", controller: :home, action: :index, via: [:get]
end
