Rails.application.routes.draw do
  
    root to: "events#index"
    devise_for :users, :controllers => { registrations: "devise/registrations" }
    resources :events
    
    # Route for user profile
    get 'profile/:id', to: 'profile#display', as: "profile"

end
