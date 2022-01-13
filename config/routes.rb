Rails.application.routes.draw do
  root "competitions#index"


  resources :competitions do
    resources :games do
      resources :players
    end
  end
  
  post "/competitions/:competition_id/games/:game_id/players/new", to: "players#create"

end

