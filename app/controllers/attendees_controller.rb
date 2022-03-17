class AttendeesController < ApplicationController

    def new
        @event = Event.find(params[:id])
    end

    def create
        @event = Event.find(params[:id])
        @event.event_registrations << current_user
        flash[:notice] = "Event registration complete!"

        redirect_to root_path
    end

    def destroy

        @event = Event.find(params[:id])
        @event.event_registrations.delete(current_user)
        flash[:notice] = "You have been removed from this event"

        redirect_to root_path
    end


end
