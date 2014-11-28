Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :auctions, except: [:destroy] do
    resources :bids, only: [:create, :show]
  end

  resources :bids, only: [:index]

  resources :users, only: [:create, :destroy]
end
