# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        users#new
#                user_works GET  /users/:user_id/works(.:format)                                                          works#index
#                           POST /users/:user_id/works(.:format)                                                          works#create
#             new_user_work GET  /users/:user_id/works/new(.:format)                                                      works#new
#              user_healths GET  /users/:user_id/healths(.:format)                                                        healths#index
#                           POST /users/:user_id/healths(.:format)                                                        healths#create
#           new_user_health GET  /users/:user_id/healths/new(.:format)                                                    healths#new
#            user_calenders GET  /users/:user_id/calenders(.:format)                                                      calenders#index
#                     users POST /users(.:format)                                                                         users#create
#              check_points GET  /modes/:id/check_points(.:format)                                                        check_points#index
#                           POST /modes/:id/check_points(.:format)                                                        check_points#create
#           new_check_point GET  /modes/:id/check_points/new(.:format)                                                    check_points#new
#                     modes GET  /modes(.:format)                                                                         modes#index
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: "users#new"

  resources :users, only: [:create] do
    resources :works, only: [:index, :new, :create]
    resources :healths, only: [:index, :new, :create]
    resources :calenders, only: [:index]
  end

  resources :modes, only: [:index] do
    member do
      resources :check_points, only: [:index, :new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
