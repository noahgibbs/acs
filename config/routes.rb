Acs::Application.routes.draw do
  get "image_sets/create"
  get "image_sets/delete"
  get "image_sets/classify"
  get "image_sets/import"
  post "image_sets/import" => "image_sets#import_post"
  get "admin/index"
  get "admin/users"
  post "admin/start_server"

  get "game" => "game#index"

  devise_for :users

  # Scaffolds for editing privileged data structures
  resources :room_states
  resources :room_types
  resources :rooms
  resources :regions
  resources :worlds

  root :to => 'players#index'

end
