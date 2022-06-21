Rails.application.routes.draw do
  devise_for :users
  # Define your application  per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"
  # Read all
  resources :breweries, only: [:index, :create, :show, :destroy]
  # Delete
  # delete "breweries/:id",      to: "breweries#destroy"
end
# Read all
# get    "restaurants",          to: "restaurants#index"
# Create
# get    "restaurants/new",      to: "restaurants#new",  as: :new_restaurant
# post   "restaurants",          to: "restaurants#create"
# Read one - The `show` route needs to be *after* `new` route.
# get    "restaurants/:id",      to: "restaurants#show", as: :restaurant
# Update
# get    "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
# patch  "restaurants/:id",      to: "restaurants#update"
# Delete
# delete "restaurants/:id",      to: "restaurants#destroy"