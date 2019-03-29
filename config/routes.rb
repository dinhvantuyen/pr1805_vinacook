Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  delete "/logout", to: "sessions#destroy"


  resources :users
  namespace :admin do
    root "dashboard#index"
    get "dashboard/index"
    resources :products
    resources :categories
  end
end
