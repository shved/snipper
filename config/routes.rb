Rails.application.routes.draw do
  devise_for :users

  root to: 'snippets#index'

  resources :snippets, except: [:destroy, :edit] do
    resources :comments, only: :create
    get :my_snippets, on: :collection
  end
end
