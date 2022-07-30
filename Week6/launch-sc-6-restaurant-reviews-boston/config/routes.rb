Rails.application.routes.draw do
  root "restaurants#index"

  resources :restaurants, only: [:create, :show, :index, :new] do
    resources :reviews, only: [:create, :index, :new]
  end
  
end
