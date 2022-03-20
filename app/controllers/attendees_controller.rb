class AttendeesController < ApplicationController

    # Create a new event attendance (pass in the event)
    def new
        @event = Event.find(params[:id])
    end

    # Add attendance to event
    def create
        @event = Event.find(params[:id])

        # Add user to registrations for event
        @event.event_registrations << current_user

        # User prompt
        flash[:notice] = "Event registration complete!"

        # Back to home page once added to event
        redirect_to root_path
    end

    # Remove user from event
    def destroy

        @event = Event.find(params[:id])

        # Remove user from event attendees
        @event.event_registrations.delete(current_user)

        # User prompt
        flash[:notice] = "You have been removed from this event"

        # Back to home page once removed from event
        redirect_to root_path
    end


end
