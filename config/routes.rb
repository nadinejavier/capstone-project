Rails.application.routes.draw do

# Events
root to: 'categories#index'
  # get '/events' => 'events#index'
  # get '/events/new' => 'events#new', as: 'new_event'
  # post '/events' => 'events#create'
  # get '/events/:id' => 'events#show', as: 'event'
  # get '/events/:id/edit' => 'events#edit'
  # patch '/events/:id' => 'events#update'
  # delete '/events/:id' => 'events#destroy'

resources :events do
  resources :comments
end

 #Sessions
 get '/login' => 'sessions#new'
 post '/sessions' => 'sessions#create'
 get '/logout' => 'sessions#destroy'

 #Categories
 get '/categories' => 'categories#index'
 get '/categories/:id' => 'categories#show'

# Users
 get '/signup' => "users#new", as:"new_user"
 post '/users' => 'users#create'
 get '/users/:id' => 'users#show', as: 'user'
 get '/users/:id/edit' => 'users#edit'
 patch '/users/:id' => 'users#update'

 #User Events
 get '/user_events' => 'user_events#index'
 post '/user_events' => 'user_events#create'
 get '/user_events/:id' => 'user_events#show'
 delete '/user_events/:id' => 'user_events#destroy'


namespace :api do
  namespace :v1 do
    get '/events' => 'events#index'
    get '/users' => 'users#index'
    get '/categories' => 'categories#index'
    get '/user_events' => 'user_events#index'
  end
end

resources :conversations do 
  resources :messages
end

end

