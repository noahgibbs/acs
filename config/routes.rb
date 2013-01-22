Acs::Application.routes.draw do
  get "admin/index"
  post "admin/start_server"

  devise_for :users

  # Scaffolds for editing privileged data structures
  resources :room_states
  resources :room_types
  resources :rooms
  resources :regions
  resources :worlds

  root :to => 'players#index'

end
