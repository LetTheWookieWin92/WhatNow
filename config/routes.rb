Rails.application.routes.draw do
  
    root to: "events#index"
    devise_for :users, :controllers => { registrations: "registrations" }
    resources :events
    

end
