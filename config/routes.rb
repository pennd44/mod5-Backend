Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :enemies, :maps
      resources :players do
        get "/dojob/:id", to: "players#dojob"  
      end   
      post "/login", to: "players#login"
    end
  end



end
