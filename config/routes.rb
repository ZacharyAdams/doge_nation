Rails.application.routes.draw do
  devise_for :users
  root to: "posts#home"
  resources :posts do
    collection do
      get 'home'
    end
  end
end
