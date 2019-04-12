Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"

  resources :carts, only: [:index, :destroy]
  resources :reviews, except: :update
  resources :product_orders
  resources :products
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :login_checkouts
  resource :checkouts
  resource :orders, only: [:new, :update]
  resource :address, only: [:create, :update]
  resource :searchs

  namespace :admin do
    get "/login", to: "login#new"
    post "/login", to: "login#create"
    delete "/logout", to: "login#destroy"
    root "dashboard#index"
    get "dashboard/index"
    resources :products
    resources :categories
    resources :users
  end

end
