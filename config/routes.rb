Silvergum::Application.routes.draw do
  devise_for :customers

  root 'home#index'

  namespace :my do
    resource :account
    resources :credentials
  end
end
