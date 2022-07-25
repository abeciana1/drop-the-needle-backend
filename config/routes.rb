Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hosts
      resources :songs
      resources :power_hours
      resources :participants
      resources :users
    end
  end
end
