Rails.application.routes.draw do
  #devise_for :users
  root to: "items#index"
  #resources :items, [:index, :create] do
    #resources :orders, only: [:index, :create]
  #end
  #resources :users, only: :show
end
