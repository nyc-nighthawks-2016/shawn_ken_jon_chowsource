Rails.application.routes.draw do

  root 'application#hello'
  resources :users
  resources :sessions, only: [:create, :destroy]
end
