class ProfileController < ApplicationController

    def display

    end

    def show_event_attendances
        @event_attendances = current_user.event_attendances
    end

end
