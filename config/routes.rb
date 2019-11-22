Rails.application.routes.draw do

  get '/', to: 'application#home', as: 'home'
  
  #resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do 
  #  resources :students do 
   #   resources :courses
   # end
  #end

  resources :users

  resources :students

  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  
resources :courses do 
  resources :meetings, only: [:new, :create, :show, :index, :destroy]
  resources :materials, only: [:index, :new, :create]
end

resources :meetings, only: [:index, :show, :destroy]

resources :materials, only: [:index, :destroy]

get '/auth/:provider/callback' => 'sessions#omniauth'

#get '/auth/github/callback' => 'sessions#omniauth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
