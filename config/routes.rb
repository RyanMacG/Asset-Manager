AssetManager::Application.routes.draw do

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/about',   to: 'static_pages#about'
  match '/help',    to: 'static_pages#help'
  match '/search',  to: 'assets#search'
  match '/last_month', to: 'assets#last_30_days'

  resources :users do
    collection { post :import }
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :assets do
   collection { post :import }
  end
  resources :password_resets
end