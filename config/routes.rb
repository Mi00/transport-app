Rails.application.routes.draw do
  root 'rates#index'
  resources :pln_invoices
  resources :buyers
  resources :sellers
  resources :rates
  resources :cars
  resources :fuels
  get '/statistics', to: 'statistic#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
