Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#index'
  resources :tours, only: [:index, :new, :create, :show, :destroy] do
    resources :members, only: [:new, :create]
  end
end
