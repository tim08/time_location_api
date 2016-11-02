Rails.application.routes.draw do
  resources :locations, only: [:create]
  resources :time_stamps, only: [:create, :index]
end
