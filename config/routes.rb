Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :supermarkets
      resources :products
      resources :lists
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
