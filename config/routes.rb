Rails.application.routes.draw do

# Events
root to: 'events#index'
  get '/events' => 'events#index'
  get '/events/new' => 'events#new', as: 'new_event'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show', as: 'event'
  get '/events/:id/edit' => 'events#edit'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#destroy'

 #Sessions
 get '/login' => 'sessions#new'
 post '/sessions' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

 #Categories
 get '/categories' => 'categories#index'
 get '/categories/:id' => 'categories#show'

# Users
 get '/signup' => "users#new", as:"new_user"
 post '/' => 'users#create'
 get '/:id' => 'users#show', as: 'user'
 get '/:id/edit' => 'users#edit'
 patch '/:id' => 'users#update'


namespace :api do
  namespace :v1 do
    get '/events' => 'events#index'
    get '/users' => 'users#index'
  end
end
#UserEvents
#get '/:user_id/events' => 'user_events#index', as: 'user_events'

end

