Rails.application.routes.draw do
  root 'users#index'

  resources :users

  namespace :admin do
    resources :users
    resources :departments
    resources :skills
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
