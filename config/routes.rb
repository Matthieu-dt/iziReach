Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'pages#dashboard'
  end
  unauthenticated :user do
    root to: 'pages#home', as: :unauthenticated_root
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show, :new, :create, :update, :edit] do
    resources :campaigns, only: [:index, :new, :create, :destroy]
  end

  resources :campaigns, only: [:show, :edit, :update] do
    resources :influencers, only: [:index]
  end

  resources :influencers, only: [:new, :create, :update, :edit, :show] do
    resources :bookings, only: [:new, :create]
      member do
        patch "update_status", to: "bookings#update_status"
      end
  end

  resources :bookings, only: [:index, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  get "/solicitations", to: "solicitations#solicitations"
end

