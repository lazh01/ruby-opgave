Rails.application.routes.draw do
  get 'rooms/list', to: "rooms#list"
  post 'rooms/create', to: "rooms#create"
  resources :rooms, only: [:new, :create, :edit, :update, :show, :destroy]
  
  get '/home', to: "landings#home"
  root "landings#home"

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
