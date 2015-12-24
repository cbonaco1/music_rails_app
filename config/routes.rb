Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  #just create, new and destroy for session
  resource :session, only: [:new, :create, :destroy]
end
