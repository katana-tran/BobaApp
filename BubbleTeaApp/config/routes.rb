Rails.application.routes.draw do
  resources :quotes
  resources :straws
  resources :cup_toppings
  resources :teas
  resources :toppings
  resources :cups
  resources :users, except: [:new,:create]
  get '/login', to: 'auth#signin', as: 'signin'
  post '/login', to: 'auth#verify'
  delete '/login', to: 'auth#signout', as: 'signout'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
