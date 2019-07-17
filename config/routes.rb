Rails.application.routes.draw do


  get '/new'
  get '/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup', to:'users#new'

  post '/signup',  to: 'users#create'

  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',to:'sessions#destroy'

  patch '/user',to:'users#update'
  delete '/user',to:'users#destroy'

  get 'user', to:'users#index'


get '/account_activations/:id/edit(.:format)', to:'account_activations#edit'
  resources :users

  resources :account_activations, only:[:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
