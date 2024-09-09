Rails.application.routes.draw do
  get '/home', to:'home#index'
  root to: 'home#index'
  resources :customers do
    member do
      get 'orders'
    end
  end

  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
