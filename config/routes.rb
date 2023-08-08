Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments
  resources :tenants
  resources :leases, only: [:create, :destroy]

  # resources :instructors, only: [ :index, :show, :create, :update, :destroy ]

  # resources :students, only: [ :index, :show, :create, :update, :destroy ]
end
