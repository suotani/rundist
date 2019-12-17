Rails.application.routes.draw do
  root to: "users#new"

  resources :users, only: [:create] do
    resources :works, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
