Rails.application.routes.draw do
  root "competitions#index"
  
  resources :competitions do
    resources :games, :teams do
      resources :players, :results
    end
  end
  
end

