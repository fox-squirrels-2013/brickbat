Brickbat::Application.routes.draw do

  root to: "posts#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :posts, except: [:edit, :update, :destroy] do
  	resources :responses, only: [:new, :create] do
      resources :comments, only: [:new, :create]
    end
  end

  post '/posts/vote', to: "posts#vote"

end
