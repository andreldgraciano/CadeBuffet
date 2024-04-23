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
  get 'home/client'

  resources :buffets, only: [:index, :show, :new, :create, :edit, :update]
end
