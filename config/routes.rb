Rails.application.routes.draw do

  resources :categories  
  resources :articles

  devise_for :users
  resources :users

  get "/index.html", to: "static_pages#index"
  get "/contacts.html", to: "static_pages#contacts"
  get "/about.html", to: "static_pages#about"

  root 'static_pages#index'
end
