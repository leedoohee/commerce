Rails.application.routes.draw do
  defaults export: true do
    resources :expenses
    resources :categories
    resources :users
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

  get "categories" => "categories#index"
  
  get "categories/show" => "categories#show"

  get "dashboard" => "dashboard#index"

  get "expenses" => "expenses#index"
  
  get "login-v2"   => "login#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
