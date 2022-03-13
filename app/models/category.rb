class Category < ApplicationRecord

    # Event can have many categories
    has_and_belongs_to_many :events

end
