Rails.application.routes.draw do

  resources :milk_prices
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

  # DAIRY_SELL ROUTES
  get '/sells', to: 'dairy_sells#index'
  get '/sells/:id', to: 'dairy_sells#show'
  post '/sells', to: 'dairy_sells#create'
  patch '/sells/:id', to: 'dairy_sells#update'
  delete '/sells/:id', to: 'dairy_sells#destroy'
  get '/sells/:id/total', to: 'dairy_sells#sold_price'
  get '/sell/total', to: 'dairy_sells#total'

  # DAIRY_COST ROUTES
  get '/costs', to: 'dairy_costs#index'
  get '/costs/:id', to: 'dairy_costs#show'
  post '/costs', to: 'dairy_costs#create'
  patch '/costs/:id', to: 'dairy_costs#update'
  delete '/costs/:id', to: 'dairy_costs#destroy'
  get '/costs/:id/total', to: 'dairy_costs#cost_price'
  get '/cost/total', to: 'dairy_costs#total'

  # MILK_PRICE ROUTES
  get '/prices', to: 'milk_prices#index'
  get '/prices/:id', to: 'milk_prices#show'
  post '/prices', to: 'milk_prices#create'
  patch '/prices/:id', to: 'milk_prices#update'
  delete '/prices/:id', to: 'milk_prices#destroy'


end
