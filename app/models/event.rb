class Event < ApplicationRecord

    # Users can be the organiser of events
    belongs_to :organiser, class_name: "User"

end
