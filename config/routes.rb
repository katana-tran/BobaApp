Rails.application.routes.draw do
  resources :quotes
  resources :straws
  resources :cup_toppings
  resources :teas
  resources :toppings, except: [:edit, :delete]
  resources :cups
  resources :users

  get '/login', to: 'auth#signin', as: 'signin'
  post '/login', to: 'auth#verify'
  delete '/login', to: 'auth#signout', as: 'signout'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  # get '/bubbles/edit', to: 'cups#edit'
  # get '/choices', to: 'cups#size'
  # get '/create-tea', to: 'cups#new', as: 'new_cup'
  # post '/create-tea/:id', to: 'cups#create'
  # get '/all-my-teas', to: 'cups#index', as: 'cups'
  # get '/all-my-teas/:id', to: 'cups#show',as: 'cup'
  
    # resources :users


#within this file, see http://guides.rubyonrails.org/routing.html
end
