Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :account_events, only: :create
  resources :log, only: :index

  # Defines the root path route ("/")
  root "log#index"
end
