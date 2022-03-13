Rails.application.routes.draw do
  
    root to: "events#index"
    devise_for :users, :controllers => { registrations: "devise/registrations" }
    resources :events
    
    get 'profile/:id', to: 'profile#show', as: "profile"

end
