Rails.application.routes.draw do
  root to: "users#new"
  post 'sign_up', to: "users#create"
  get '/login', to: 'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
end
