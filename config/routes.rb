Rails.application.routes.draw do
  root 'pictures#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :pictures
end
