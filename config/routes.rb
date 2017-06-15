Rails.application.routes.draw do
 root to: 'users#index'
 get '/' => 'users#index', as: 'users'
 get '/signup' => "users#new", as:"new_user"
 post '/' => 'users#create'
 get '/:id' => 'users#show', as: 'user'
end

#   Prefix Verb URI Pattern       Controller#Action
#     root GET  /                 user#index
#    users GET  /                 users#index
# new_user GET  /signup(.:format) users#new
#          POST /                 users#create