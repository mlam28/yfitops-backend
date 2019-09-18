Rails.application.routes.draw do
  resources :likes
  resources :song_playlists
  resources :playlists
  resources :user_playlists
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/login', to: 'users#login'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
