Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hosts
      resources :songs
      resources :power_hours
      resources :participants
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/session-renew', to: 'users#session_renew'
    end
  end
end
