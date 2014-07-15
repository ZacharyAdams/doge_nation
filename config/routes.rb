Rails.application.routes.draw do
  root to: 'static_pages#index'
  resources :static_pages, only: [:index]
  devise_for :users
  resources :posts do
    resources :replies, only: [:create, :new, :destroy, :edit, :update]
  end
end
