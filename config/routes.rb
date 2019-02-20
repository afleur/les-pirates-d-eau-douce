Rails.application.routes.draw do
  get 'rentals/index'
  get 'rentals/show'
  get 'rentals/create'
  get 'rentals/new'
  get 'rentals/destroy'
  get 'rentals/edit'
  get 'rentals/update'
  devise_for :users
  root to: 'pages#home'

  resources :users

  resources :boats, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
