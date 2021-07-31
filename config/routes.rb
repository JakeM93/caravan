Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [ :new, :create, :index, :show ]
  end
  # All Routes for now untill other models and routes are defined
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
