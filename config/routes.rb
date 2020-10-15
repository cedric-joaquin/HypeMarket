Rails.application.routes.draw do
  resources :bids
  resources :auctions, except: [:edit, :update]
  patch '/auctions/:id' => 'auctions#sold'

  resources :users, only: [:show, :create] do
    resources :auctions, except: [:edit, :update]
  end

  get '/signup' => 'users#new'

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/auth/google_oauth2/callback' => 'sessions#create'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
