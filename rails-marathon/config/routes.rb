Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "houses#index"

  resources :houses, only: [:index, :new, :create, :show] do
    resources :members, only: [:index, :new, :create]
  end
end
