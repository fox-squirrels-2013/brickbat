Brickbat::Application.routes.draw do

  root to: "posts#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :posts, except: [:edit, :update, :destroy] do
  	resources :responses, only: [:new, :create] do
      resources :comments, only: [:new, :create, :index]
    end
  end

  get '/check', to: "posts#check"
  resources :votes, only: [:create]

  resources :comments, only: :show

  post '/posts/vote', to: "posts#vote"


end
