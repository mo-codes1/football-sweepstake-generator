Rails.application.routes.draw do
  root "competitions#index"
  
  get "/competitions", to: "competitions#index"
end
