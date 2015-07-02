Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  devise_for :users
  resources :users
  
  resources :comparative_products
  resources :products
  resources :comparatives
  resources :clients
  
  post '/guardar_comparativa' => "home#guardar_comparativa"
  
  # get "/pdf" => "pdfs#ejemplo"
end
