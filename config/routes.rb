Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  get '/cars/my_cars', to: 'cars#my_cars'

  resources :cars do
    resources :bookings, only: [ :new, :create, :index, :show, :destroy ]
  end


  # All Routes for now untill other models and routes are defined
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
