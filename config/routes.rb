Rails.application.routes.draw do
  root "competitions#index"

  get "/teams", to: "teams#index"
  
  resources :competitions do
    resources :games
  end
end
