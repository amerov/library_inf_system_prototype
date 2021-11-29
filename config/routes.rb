Rails.application.routes.draw do
  root 'home#index'
  resources :replenishments
  resources :employees
  resources :types
  resources :foundations
  resources :libs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
