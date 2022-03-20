class User < ApplicationRecord

    # Devise configuration (see README)
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

    # Each user has optionally many organised events, identified by the organiser_id foreign key. If user is deleted, so are their events
    has_many :organised_events, class_name: "Event", foreign_key: "organiser_id", dependent: :destroy

    # Each user has optionally many event attendances, which are destroyed if the user is deleted. Attendances are linked to user via the attendee_id foreign key
    has_many :attendees, dependent: :destroy
    has_many :event_attendances, through: :attendees, source: :event, foreign_key: "attendee_id" 
end
