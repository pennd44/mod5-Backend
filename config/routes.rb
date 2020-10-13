Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :players, :enemies
      # patch "/players/:player_id/dojob/:id", to player#dojob(job_id)
      post "/login", to: "players#login"
    end
  end



end
