Rails.application.routes.draw do
  root "home#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "sign_up", to: "players#new"
  post "sign_up", to: "players#create"

  resources :board_games, only: [ :new, :create, :show, :index, :destroy ]
end
