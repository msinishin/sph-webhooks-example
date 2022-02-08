Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resource :account_created, only: :create, controller: :account_created
  resource :account_updated, only: :create, controller: :account_updated

  resources :events, only: :index

  # Defines the root path route ("/")
  root "events#index"
end
