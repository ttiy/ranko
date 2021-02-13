Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end

  root 'tops#index'
  resources :tops, only: :index
  resources :articles, only: [:new, :create]
  resources :my_pages, only: :index
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create]
      resources :my_pages, only: [:index, :destroy]
    end
  end
end
