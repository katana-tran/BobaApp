Rails.application.routes.draw do
  resources :quotes
  resources :straws
  resources :cup_toppings
  resources :teas
  resources :toppings
  resources :cups, except: [:edit, :index, :size, :new]
  resources :users, except: [:new,:create]
  get '/login', to: 'auth#signin', as: 'signin'
  post '/login', to: 'auth#verify'
  delete '/login', to: 'auth#signout', as: 'signout'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/bubbles/edit', to: 'cups#edit'
  get '/choices', to: 'cups#size'
  get '/all-my-teas', to: 'cups#index'
  get '/create-tea', to: 'cups#new'
  get '/all-my-teas/:id', to: 'cups#show'


#within this file, see http://guides.rubyonrails.org/routing.html
end
