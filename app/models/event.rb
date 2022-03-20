class Event < ApplicationRecord

    # Each event belongs to a User (organiser)
    belongs_to :organiser, class_name: "User"

    # Each event has optionally many attendees, upon deletion of event all attendees for that event are also removed
    has_many :attendees, dependent: :delete_all

    # Each event has optionally many registrations, upon deletion of event all registrations for that event are also removed
    has_many :event_registrations, through: :attendees, source: :user

    # Each event has an optional image (AWS)
    has_one_attached :picture

end
