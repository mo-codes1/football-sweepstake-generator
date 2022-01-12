Rails.application.routes.draw do
  root "competitions#index"


  resources :competitions do
    resources :games
  end

  get "players/new", to: "players#new"
  
  

end
