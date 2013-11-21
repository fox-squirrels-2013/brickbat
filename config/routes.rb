Brickbat::Application.routes.draw do

  root to: "sessions#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :posts, except: [:edit, :update, :destroy]
  resources :responses, only: [:new, :create]
  post '/posts/vote', to: "posts#vote"

end
