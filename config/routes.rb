Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/users', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
