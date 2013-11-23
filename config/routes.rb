Brickbat::Application.routes.draw do

  root to: "posts#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :posts, except: [:edit, :update, :destroy] do
  	resources :responses, only: [:new, :create]
  end

  get '/check', to: "posts#check"
  resources :votes, only: [:create]

end
