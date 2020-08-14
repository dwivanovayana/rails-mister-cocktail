Rails.application.routes.draw do
  get 'reviews/create'
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :new, :show, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
