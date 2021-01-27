Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
      resources :enemies, :maps
      resources :players do
        get "/dojob/:id", to: "players#dojob"
        get "/unequip/:slot", to: "players#unequip_item"  
        get "/equip/:id", to: "players#equip_item"  
        get "/obtainitem/:id", to: "players#obtain_item"  
        get "/learnskill/:id", to: "players#learn_skill"
        patch "/winbattle/:id", to: "players#win_battle" 
        patch "/losebattle/:id", to: "players#lose_battle" 
      end   
      post "/login", to: "players#login"
    end
  end



end
