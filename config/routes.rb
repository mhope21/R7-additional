Rails.application.routes.draw do
  get '/home', to:'home#index'
  
  root to: 'home#index'

  resources :customers do
    member do
      get 'orders'
    end
  end

  resources :orders
  
end
