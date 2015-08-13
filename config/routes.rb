Rails.application.routes.draw do
  devise_for :users
  mount Bootsy::Engine => "/bootsy", as: "bootsy"

  root "static_pages#home"

  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"

  resources :books, only: [:index, :show, :update] do
    resource :book_user, only: [:create, :update]
  end
  resources :reviews, except: [:index, :show]
  resources :comments, except: [:index, :show]
  resources :requests, except: [:edit, :update]

  namespace :admin do
    root "categories#index"
    resources :books
    resources :categories
    resources :requests, only: [:index, :update]
    resources :users, only: [:index,:destroy]
  end

  resources :users do
    get "/:relationship" => "relationships#index", as: :relationship,
      constraints: {relationship: /(following|followers)/}
  end

  resources :relationships, only: [:index, :create, :destroy]
end
