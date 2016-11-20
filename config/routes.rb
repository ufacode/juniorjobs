Rails.application.routes.draw do
  # as :user do
  #   patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
  # end
  # devise_for :users, :controllers => { :confirmations => "confirmations" }
  devise_for :users, :controllers => { :confirmations => "users/confirmations" }
  resources :profiles

  # resources :users do
  #   member do
  #     get :confirm_email
  #   end
  # end
  # resources :confirmations
  root to: 'profiles#index'
end
