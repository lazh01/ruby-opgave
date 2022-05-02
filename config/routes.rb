Rails.application.routes.draw do
  get 'rooms/index', to: "rooms#index"
  post 'rooms/create', to: "rooms#create"
  post'rooms/incpage', to: "rooms#incpage"
  resources :rooms, only: [:new, :create, :edit, :update, :show, :destroy]

  resources :rooms do
    resources :messages
  end

  get '/home', to: "landings#home"
  root "landings#home"


  post '/change_avatar', to: 'users#change_avatar'
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
