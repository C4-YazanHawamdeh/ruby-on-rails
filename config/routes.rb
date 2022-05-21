Rails.application.routes.draw do
  # devise_for :models
  # get 'sessions/login'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :jobs
#Users routes
resources:users,only:[:new,:create,:edit,:update,:show,:destroy]
#Sessions routes
get'/login',to:'session#login'
post'/login',to:'session#login'
post'/logout',to:'sessions#destroy'
get'/logout',to:'sessions#destroy'
  root "jobs#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
