Brickbat::Application.routes.draw do
  root to: "sessions#index"
  get "/auth/:provider/callback", to: "sessions#create"
  get '/logout', to: "sessions#destroy"
end
