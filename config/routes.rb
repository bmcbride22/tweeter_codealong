require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :tweets, except: %i[edit update]
  devise_for :users
  root to: 'tweets#index'
end
