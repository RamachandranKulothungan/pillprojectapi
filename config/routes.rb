Rails.application.routes.draw do
  resources :histories
  resources :dependents
  root 'home#index'
  get "sessions/user", "sessions#user"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get "users/:user_id/dependents", to: "dependents#get_for_user" 
  get "histories/user/:user_id", to: "histories#get_for_user"
  get "histories/user/:user_id/current", to: "histories#get_for_user_current"
  put "session/update_password", to: "sessions#update_password"
  # get 'signup', to: 'users#new', as: 'signup'
  # get 'login', to: 'sessions#new', as: 'login'
  #get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
