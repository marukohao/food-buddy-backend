Rails.application.routes.draw do
  resources :restaurants
  resources :joins
  get '/notifications', to: 'joins#notification'
  resources :hosts
  get '/notification', to: 'hosts#notification'
  get '/hostevents', to: 'hosts#hostevents'
  resources :users, only: [:create, :show]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


