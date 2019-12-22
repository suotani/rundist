Rails.application.routes.draw do
  get 'calender/index'
  root to: "users#new"

  resources :users, only: [:create] do
    resources :works, only: [:index, :new, :create]
    resources :calenders, only: [:index]
  end

  resources :modes, only: [:index] do
    member do
      resources :check_points, only: [:index, :new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
