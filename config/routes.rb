Rails.application.routes.draw do
  devise_for :users
  mount Bootsy::Engine => "/bootsy", as: "bootsy"

  root "static_pages#home"

  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"

  resources :books, only: [:index, :show]
  resources :reviews, except: [:index, :show]
  resources :requests, only: [:create, :destroy, :index, :new]

  namespace :admin do
    root "categories#index"
    resources :books
    resources :categories
    resources :requests, only: [:index, :update]
  end

  resources :users do
    get "/:relationship" => "relationships#index", as: :relationship,
      constraints: {relationship: /(following|followers)/}
  end

  resources :relationships, only: [:index, :create, :destroy]
end
