Rails.application.routes.draw do
  resources :notifications
  resources :messages
  resources :restaurants
  resources :joins
  get '/notification1', to: 'joins#notification1'
  resources :hosts
  get '/notification', to: 'hosts#notification'
  get '/hostevents', to: 'hosts#hostevents'
  get '/getmessages', to: 'hosts#getmessages'
  resources :users, only: [:create, :show, :update, :index]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


