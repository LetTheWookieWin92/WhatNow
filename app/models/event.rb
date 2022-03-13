class Event < ApplicationRecord

    # Users can be the organiser of events
    belongs_to :organiser, class_name: "User"

    has_many :attendees
    has_many :event_registrations, through: :attendees, source: :user

    # Event can have many categories
    has_and_belongs_to_many :categories

end
