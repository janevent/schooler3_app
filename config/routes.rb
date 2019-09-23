Rails.application.routes.draw do

  get '/', to: 'application#home', as: 'home'
  
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do 
    resources :students do 
      resources :courses
    end
  end

  get '/courses', to: 'courses#index_all'

  get '/login', to: 'sessions#new'
  post '/users', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  
  #resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
