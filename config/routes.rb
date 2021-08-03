Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_bookings', to: 'bookings#my_bookings'
  resources :cars do
    collection do
      get :my_cars
    end
    resources :bookings, only: [ :new, :create, :index, :show, :destroy ] do
      collection do
        get :my_bookings
      end
    end
  end
  # All Routes for now untill other models and routes are defined
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end