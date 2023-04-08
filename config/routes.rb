Rails.application.routes.draw do
  
  resources :dairy_sells
  resources :milks
  resources :animals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # ADMIN ROUTES
  get '/', to: 'admins#index'
  get '/admins/:id', to: 'admins#show'
  post '/admins', to: 'admins#create'
  patch '/admins/:id', to: 'admins#update'
  delete '/admins/:id', to: 'admins#destroy'

  # ANIMAL ROUTES
  get '/animals', to: 'animals#index'
  get '/animals/:id', to: 'animals#show'
  post '/animals', to: 'animals#create'
  patch '/animals/:id', to: 'animals#update'
  delete '/animals/:id', to: 'animals#destroy'

  # MILK ROUTES
  get '/milks', to: 'milks#index'
  get '/milks/:id', to: 'milks#show'
  post '/milks', to: 'milks#create'
  patch '/milks/:id', to: 'milks#update'
  delete '/milks/:id', to: 'milks#destroy'
  get '/milks/:id/milk_kgs', to: 'milks#milk_kgs'
  get '/milk/total', to: 'milks#total'
  get '/milk/:id/total_animal', to: 'milks#total_animal'

end
