Rails.application.routes.draw do
  namespace :api do
    namespace :api do
      resources :hosts
      resources :songs
      resources :power_hours
      resources :participants
      resources :users
    end
  end
end
