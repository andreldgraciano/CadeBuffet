Rails.application.routes.draw do
  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations'
  }

  devise_for :buffet_profiles, controllers: {
    sessions: 'buffet_profiles/sessions',
    registrations: 'buffet_profiles/registrations'
  }

  root to: 'home#index'
  get 'home/buffet_profile'

  resources :buffets, only: [:index, :show, :new, :create, :edit, :update]
  resources :events, only: [:new, :create, :edit, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create]

  post 'orders/:id/confirm', to: 'orders#confirm', as: :confirm_order
  post 'orders/:id/accept', to: 'orders#accept', as: :accept_order
  post 'orders/:id/cancel', to: 'orders#cancel', as: :cancel_order
end
