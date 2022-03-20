class Attendee < ApplicationRecord
    # Each attendee belongs to a single user and single event
    belongs_to :user
    belongs_to :event
end
