Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'edit', to: 'users#edit'
  patch 'update', to: 'users#update'
  put 'update', to: 'users#update'

  resources :users
end
