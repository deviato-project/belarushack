Rails.application.routes.draw do
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users, only: [:index, :new, :create]
  resources :orders, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/success', to: 'success#success'
  get '/report', to: 'report#report'
end
