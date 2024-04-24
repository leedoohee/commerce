Rails.application.routes.draw do
  defaults export: true do
    resources :categories
    resources :products
    resources :users
    resources :orders
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "categories-search" => "categories#search"

  get "categories" => "categories#index"
  
  get "categories/show" => "categories#show"

  get "categories/new" => "categories#new"

  post "categories/create" => "categories#create"

  get "products" => "products#index"
  
  get "products/show" => "products#show"

  get "orders" => "orders#index"

  get "orders/show" => "orders#show"

  get "dashboard" => "dashboard#index"

  get "expenses" => "expenses#index"
  
  get "login-v2"   => "login#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
