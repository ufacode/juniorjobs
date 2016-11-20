Rails.application.routes.draw do
  devise_for :users, :controllers => { :confirmations => "users/confirmations" }
  resources :profiles

  root to: 'profiles#index'
end
