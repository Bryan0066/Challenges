Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "homes#index"

  namespace :api do
    namespace :v1 do 
      resource :fortune, only: [:show, :create]
    end
  end
end
