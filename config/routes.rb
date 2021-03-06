Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'users#index'
    get '/users/new', to: 'users#new', as: 'new_user'
    post '/users', to: 'users#create'
    get '/login', to: 'sessions#new'
    post '/sessions', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    delete '/users/:id', to:"users#destroy"
    get '/cities/:city_id', to: 'cities#show', as: 'city'
    post '/cities', to: 'cities#new', as: 'new_city'
    get '/cities', to: 'cities#index'
    get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
    get '/users/:id', to: 'users#show', as: 'user'
    patch '/users/:id', to:'users#update'
    get '/users/:id/posts/:post_id', to:'posts#show', as: 'user_post'
    get '/users/:id/posts/:post_id/edit', to:'posts#edit', as: 'edit_user_post'
    patch '/users/:id/posts/:post_id', to:"posts#update"
    delete '/users/:id/posts/:post_id', to:"posts#destroy"
    get '/cities/:city_id/posts', to:"posts#new", as: 'city_post'
    post 'cities/:city_id/posts', to:"posts#create"
end
