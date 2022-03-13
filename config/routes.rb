Rails.application.routes.draw do
  
    root to: "events#index"
    devise_for :users, :controllers => { registrations: "devise/registrations" }
    resources :events
    
    # Route for user profile
    get 'profile/:id', to: 'profile#display', as: "profile"

    post '/users/:user_id/events/:id', to: "attendees#create", as: "create_attendee"
    get '/profile/:id/event_attendances', to: "profile#show_event_attendances", as: "show_event_attendances"

end
