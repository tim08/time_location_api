Rails.application.routes.draw do
  resources :locations, only: [:create, :show]
  resources :time_stamps, only: [:create, :index, :show]
end
