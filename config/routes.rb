Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users
  resources :users

# Отправка комментариев
  match "/comment_create", via: [:get, :post], :to => 'articles#comment_create'  

  get 'articles' => 'articles#index', as: :articles
  match 'articles/new' => 'articles#new', via: [:get, :post], as: :new_article

  match 'tag/:tag', to: 'articles#tag', via: [:get, :post], as: :tag
  get 'tag/', to: 'articles#tag'

  get 'categories' => 'categories#index', as: :categories
  match 'categories/new' => 'categories#new', via: [:get, :post], as: :new_category
  #post '/:id' => 'categories#create'
  match ':id/edit' => 'categories#edit', via: [:get, :post], as: :edit_category  

  get "/index.html", to: "static_pages#index"
  get "/contacts.html", to: "static_pages#contacts"
  get "/about.html", to: "static_pages#about"

  resources :categories, path: "" do
    resources :articles, path: "" do
      member do
      	put :tog
    	end
    end
  end

end
