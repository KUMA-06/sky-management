Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#index'
  resources :tours, only: [:index, :new, :create, :show, :destroy] do
    resources :members, only: [:new, :create, :destroy]
    resources :categories, only: [:index, :create]
  end
end
