Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "layouts#show"

  namespace :api do
    namespace :v1 do
      resource :cereal
    end
  end

  resource :cereal
end