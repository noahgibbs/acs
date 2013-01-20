Acs::Application.routes.draw do
  # Scaffolds for editing privileged data structures
  resources :room_states
  resources :room_types
  resources :rooms
  resources :regions
  resources :worlds

  root :to => 'player#index'

end
