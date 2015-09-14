Rails.application.routes.draw do

  resources :articles

  devise_for :users
  get "/index.html", to: "static_pages#index"
  get "/contacts.html", to: "static_pages#contacts"
  get "/about.html", to: "static_pages#about"

  root 'static_pages#index'
end
