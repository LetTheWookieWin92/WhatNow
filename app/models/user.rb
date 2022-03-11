class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

    has_many :organised_events, class_name: "Event", foreign_key: "organiser_id", dependent: :destroy
end
