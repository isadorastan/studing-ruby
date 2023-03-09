Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index", as: :about
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete "logout", to: "sessions#destroy"

  root to: "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
