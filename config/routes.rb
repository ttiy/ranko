Rails.application.routes.draw do
  get 'my_pages/index'
  get 'my_pages/show'
  get 'my_pages/new'
  get 'my_pages/create'
  get 'my_pages/edit'
  get 'my_pages/update'
  get 'my_pages/destroy'
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
  resources :articles, only: [:new, :create, :destroy]
  resources :my_pages, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :articles, only: [:index, :show]
    end
  end
end
