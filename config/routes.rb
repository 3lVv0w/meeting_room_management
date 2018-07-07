require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount API::Base, at: "/"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :meeting_rooms do
    resources :reservations do
      get 'cancle', on: :member
    end
  end

  resources :users
end
