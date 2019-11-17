Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
  resources :cocktails, only: [:index, :new, :show, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
end
