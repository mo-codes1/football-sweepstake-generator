Rails.application.routes.draw do
  root "competitions#index"
  
  get "/competitions", to: "competitions#index"
  get "/competitions/:id", to: "competitions#show"
end
