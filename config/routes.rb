Rails.application.routes.draw do

  get '/', to: 'applications#home', as: 'home'
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/users', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
