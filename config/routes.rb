Rails.application.routes.draw do
  resources :bids
  resources :auctions, except: [:edit, :update]
  root 'users#show'
  patch '/auctions/:id' => 'auctions#sold'

  resources :users, only: [:show, :create] do
    resources :auctions, except: [:edit, :update]
  end

  get '/signup' => 'users#new'

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/users/:id/purchases' => "users#purchases", as: "user_purchases"
  get '/users/:id/bids' => "users#bids", as: "user_bids"
  

  get '/auth/google_oauth2/callback' => 'sessions#create'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
