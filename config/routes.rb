Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :clients, only: [:index, :show, :new, :create] do
    resources :documents, only: [:new, :create]
  end
  resources :users, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
end
