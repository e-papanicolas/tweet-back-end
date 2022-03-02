Rails.application.routes.draw do

  resources :events, only: [:create, :show, :destroy]
  resources :users, only: [:create, :index, :update, :destroy] #create - signup

  post '/login', to: 'auth#create'
  get '/me', to: 'users#me' #profile page
  mount ActionCable.server => '/cable'
  get '/streamstart/:id', to: 'events#start_streaming' #starts the twitterstream

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  # root "articles#index"
end
