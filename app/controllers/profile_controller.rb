class ProfileController < ApplicationController

    # Show user profile
    def display

    end

    # List of events user is attending
    def show_event_attendances
        @event_attendances = current_user.event_attendances
    end

end
