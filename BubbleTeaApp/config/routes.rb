Rails.application.routes.draw do
  resources :quotes
  resources :straws
  resources :cup_toppings
  resources :teas
  resources :toppings
  resources :cups, except: [:edit]
  resources :users

 get '/bubbles/edit', to: 'cups#edit'
 get '/cups/all', to: 'cups#index'
#  get '/cups/all', to: 'cups#show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
