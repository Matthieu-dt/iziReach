Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies, only: [:new, :create, :update, :edit]

  resources :influencers, only: [:new, :create, :update, :edit] do
    resources :bookings, only: [:edit, :update]
  end

  resources :campaigns do
      resources :bookings, only: [:new, :create, :index]
  end

  resources :bookings, only: [:destroy] do
    resources :reviews, only: [:new, :create]
  end

  get "/solicitations", to: "bookings#solicitations"
end

