Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/create'
  get 'orders/new'
  devise_for :users
  
  root to: "items#index"
  
  resources :items, only: [:new, :create, :show, :index, :destroy, :edit, :update]do
    resources :orders, only: [:index, :create, :new]
  end


end
