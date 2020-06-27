Rails.application.routes.draw do
  resources :photos
  resources :users
  post "login", to: "authentication#login"
  get "profile", to: "users#profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
