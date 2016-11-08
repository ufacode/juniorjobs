Rails.application.routes.draw do
  devise_for :users
  resources :profiles

  # resources :users do
  #   member do
  #     get :confirm_email
  #   end
  # end
  root to: 'profiles#index'
end
