Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  # Read all
  resources :brewery, only: [:create, :show, :index, :destroy]
  # Delete
  # delete "breweries/:id",      to: "breweries#destroy"
end
