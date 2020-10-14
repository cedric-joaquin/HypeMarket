Rails.application.routes.draw do
  resources :bids
  resources :auctions

  resources :users, only: [:show, :create] do
    resources :auctions
  end

  get '/signup' => 'users#new'

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  get '/auth/:provider/callback' => 'sessions#create'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
