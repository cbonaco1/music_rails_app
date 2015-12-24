Rails.application.routes.draw do
  resources :users

  #just create, new and destroy for session
  resource :session, only: [:new, :create, :destroy]
end
