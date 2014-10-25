Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, path: '' do
    resources :projects
  end
end
