Rails.application.routes.draw do
  root :to => 'static_pages#home'
  get '/static_pages/home', :to =>'static_pages#home'
  get 'static_pages/home'
  devise_for :users
  resources :posts do
        resources :replies, only: [:create, :new, :destroy, :edit, :update]
  end
end
