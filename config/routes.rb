Rails.application.routes.draw do

# Events
  get '/events' => 'events#index'
  get '/events/new' => 'events#new', as: 'new_event'
  post '/events' => 'events#create'

 #Sessions
 get '/login' => 'sessions#new'
 post '/sessions' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

# Users
 root to: 'users#index'
 get '/' => 'users#index', as: 'users'
 get '/signup' => "users#new", as:"new_user"
 post '/' => 'users#create'
 get '/:id' => 'users#show', as: 'user'

#UserEvents
get '/:user_id/events' => 'user_events#index', as: 'user_events'

end

