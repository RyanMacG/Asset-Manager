AssetManager::Application.routes.draw do

  root 'static_pages#home'

  match '/signup',  to: 'users#new', via: :get
  match '/signin',  to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/about',   to: 'static_pages#about', via: :get
  match '/help',    to: 'static_pages#help', via: :get
  match '/search',  to: 'assets#search', via: :get
  match '/last_month', to: 'assets#last_30_days', via: :get

  resources :users do
    collection { post :import }
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :assets do
   collection { post :import }
  end
  resources :password_resets
end