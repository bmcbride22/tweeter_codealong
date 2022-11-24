require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :tweets, except: %i[edit update] do
    resources :comments, only: %i[create destroy]
    member do
      post :retweet
    end
  end
  resources :profiles

  devise_for :users
  root to: 'tweets#index'
end
