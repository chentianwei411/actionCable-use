require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    member do
      post "like", to: "posts#like"
      post 'unlike', to: "posts#unlike"
      post "toggle_flag", to: "posts#toggle_flag"
    end
  end

  get '/jquery-1', to: "pages#jquery_1"
  get '/jquery-2', to: "pages#jquery_2"
  get '/jquery-3', to: 'pages#jquery_3'
  get '/jquery-4', to: 'pages#jquery_4'
  get '/jquery-5', to: 'pages#jquery_5'
  get '/about', to: 'pages#about'

  get '/home', to: "home#index"

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
  root to: 'posts#index'
end
