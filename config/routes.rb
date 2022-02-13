Rails.application.routes.draw do
  resources :events, only: [:create]
 
  resources :users, only: [:create] #create - signup
  post '/login', to: 'auth#create'
  get '/me', to: 'users#me' #profile page
  mount ActionCable.server => '/cable'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  # root "articles#index"
end
