Rails.application.routes.draw do
  resources :quotes
  resources :straws
  resources :cup_toppings
  resources :teas
  resources :toppings
  resources :cups
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
