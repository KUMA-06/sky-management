Rails.application.routes.draw do
  root to: 'tours#index'
  resources :tours, only: [:index, :new, :create, :show, :destroy]
end
