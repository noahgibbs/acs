Acs::Application.routes.draw do
  get "admin/index"

  devise_for :users

  # Scaffolds for editing privileged data structures
  resources :room_states
  resources :room_types
  resources :rooms
  resources :regions
  resources :worlds

  root :to => 'players#index'

end
