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


end
