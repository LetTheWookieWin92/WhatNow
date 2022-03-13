class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = current_user.organised_events.build
    end

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

    private

    def event_params
        params.require(:event).permit(:dateTime, :location)
    end

end
