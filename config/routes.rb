Rails.application.routes.draw do
  devise_for :users
  mount Bootsy::Engine => "/bootsy", as: "bootsy"
  root "static_pages#home"

  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"

  resources :books, only: :index

  namespace :admin do
    root "categories#index"
    resources :books
    resources :categories
  end
end
