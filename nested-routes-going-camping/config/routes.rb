Rails.application.routes.draw do
  resources :campers, only: [:show, :index] do
    resources :supplies, only: [:index]
  end

  resources :campsites, only: [:index, :new, :show] do
    resources :campers, only: [:index]
  end

  resources :supplies, only: [:index]

end
