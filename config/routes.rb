Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  delete "/logout", to: "sessions#destroy"
  get "/checkouts", to: "checkouts#index"

  resources :carts, only: [:index, :destroy]
  resources :reviews, only: :create
  resources :product_orders
  resources :products
  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :admin do
    root "dashboard#index"
    get "dashboard/index"
    resources :products
    resources :categories
  end
end
