Rails.application.routes.draw do
  
  resources :users, only: [:index, :show] 
    resources :posts, only:[:index, :create, :show, :destroy] do
      resources :comments, only: [:create]
    end

  post '/signup', to: "users#create"
  get '/profile', to: "users#show"
  post '/login', to: "sessions#login"
  get '/me', to: "sessions#autologin"
  #get '/posts', to: "posts#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
end
