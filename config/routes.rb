Rails.application.routes.draw do
  get 'check_points/index'
  get 'check_points/new'
  get 'check_points/create'
  get 'modes/index'
  get 'modes/new'
  get 'modes/create'
  get 'calender/index'
  root to: "users#new"

  resources :users, only: [:create] do
    resources :works, only: [:index, :new, :create]
  end

  resources :modes, only: [:index] do
    member do
      resources :check_points, only: [:index, :new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
