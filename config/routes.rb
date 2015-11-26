Rails.application.routes.draw do
  devise_for :users

  root to: 'snippets#index'

  resources :snippets
end
