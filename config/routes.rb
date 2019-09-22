Rails.application.routes.draw do

  get '/', to: 'application#home', as: 'home'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do 
    resources :students
  end

  get '/login', to: 'sessions#new'
  post '/users', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
