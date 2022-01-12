Rails.application.routes.draw do
  root "competitions#index"
  get "players/new", to: "players#new"
  
  get "/competitions", to: "competitions#index"
end
