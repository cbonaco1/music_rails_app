Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  #just create, new and destroy for session
  resource :session, only: [:new, :create, :destroy]

  resources :bands
  resources :albums
  resources :tracks
  #will delete some of these
end
