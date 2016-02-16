Rails.application.routes.draw do
  


  root to: 'sessions#new'

########################

  get '/groups', to: 'groups#index'

  get '/groups/new', to: 'groups#new', as: 'new_group'

  post '/groups', to: 'groups#create', as: 'create_group'

  get '/groups/:id', to: 'groups#show', as: 'show_group'

  get '/groups/:id/edit', to: 'groups#edit'

  put '/groups/:id', to: 'groups#update'

  delete '/groups/:id', to: 'groups#delete'

########################

  get '/users', to: 'users#index'

  get '/users/new', to: 'users#new'

  post '/users', to: 'users#create', as: 'create_user'

  get '/users/:id', to: 'users#show', as: 'show_user'

  get '/users/:id/edit', to: 'users#edit'

  put '/users/:id', to: 'users#update'

  delete '/users/:id', to: 'users#delete'

###########################

  get '/sessions', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  delete '/sessions', to: 'sessions#destroy'

############################

  get '/groups/:id/invites', to: 'invites#new', as: 'invites_new'

  post 'invites/create', to: 'invites#create', as: 'invites_create'

############################

  get '/groups/:id/gifts', to: 'gifts#new', as: 'gifts_new'

  post '/gifts/create', to: 'gifts#create', as: 'gifts_create'

############################

  get '/posts/new', to: 'posts#new', as: 'posts_new'

  post '/posts/create', to: "posts#create", as: 'posts_create'

##############################

  get 'votes/new', to: 'votes#new', as: 'votes_new'

  post 'votes/create', to: 'votes#create', as: 'votes_create'

end
