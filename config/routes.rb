Brickbat::Application.routes.draw do

  resources :posts, except: [:edit, :update, :destroy]
  resources :responses, only: [:new, :create]

end
