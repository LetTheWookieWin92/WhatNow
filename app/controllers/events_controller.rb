class EventsController < ApplicationController

    # Present all available events to user (needs refactoring to present available events in sets of 10)
    def index
        @events = Event.all
    end

    # Create a new event
    def new
        @event = current_user.organised_events.build
    end

    # Create a new event and prompt user
    def create
        @event = current_user.organised_events.build(event_params)

        respond_to do |format|
            if @event.save
                format.html {redirect_to profile_path(current_user.id), notice: "Event was successfully created"}
            else
                format.html { render :new }
            end
        end
        
    end

    # Event detail view
    def show
        @event= Event.find(params[:id])
    end

    # Organise event form containing existing data
    def edit
        @event= Event.find(params[:id])
    end

    # Make updates to event 
    def update
        @event= Event.find(params[:id])
        if @event.update(event_params)
            flash[:success] = "Event updated"
            redirect_to root_path
        else
            @event.errors.full_messages.each do |message|
            flash[:error] = message
            end
            render :edit
        end
    end

    # If user is organiser, delete the event (and dependents)
    def destroy
        @event= Event.find(params[:id])
        if @event.organiser != current_user
            flash[:error] = "Only the organiser of this event can cancel it"
            redirect_to root_path
        else
            @event.destroy
            flash[:success] = "Event has been cancelled"
            redirect_to events_path
        end
    end

    private

    # Convenience method to pass in all event attributes
    def event_params
        params.require(:event).permit(
            :title,
            :description,
            :dateTime, 
            :location,
            :price,
            :capacity,
            :category,
            :picture
        )
    end

end
