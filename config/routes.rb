Rails.application.routes.draw do
  root "static_pages#home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources :users
  namespace :admin do
    root "dashboard#index"
    get "dashboard/index"
  end
end
