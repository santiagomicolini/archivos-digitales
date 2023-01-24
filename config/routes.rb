Rails.application.routes.draw do
  devise_for :users
  get "/documents/:id/download", to: "documents#download", as: "document_download"
  get "/documents/:id/preview/", to: "documents#preview", as: "document_preview"

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index]

  resources :clients, only: [:index, :show, :new, :create] do
    resources :documents, only: [:new, :create]
  end
end
