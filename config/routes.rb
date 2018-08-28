Rails.application.routes.draw do
  devise_for :users
  root 'rates#index'
  resources :pln_invoices
  resources :buyers
  resources :sellers
  resources :rates
  resources :cars
  resources :fuels
  get '/statistic/rates', to: 'statistic#rates'
  get '/statistic/tanks', to: 'statistic#tanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
