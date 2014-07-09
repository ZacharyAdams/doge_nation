Rails.application.routes.draw do
  devise_for :users
  root to: "posts#home"
  resources :posts, only: [:index]
end
