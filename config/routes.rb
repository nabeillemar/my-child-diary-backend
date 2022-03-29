Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :attendances, only: [:index, :create, :show, :update, :destroy]
      resources :children, only: [:index, :create, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      end 
  end 
end 