class Event < ApplicationRecord
  belongs_to :buffet

  validates :name, :description, :min_people, :max_peaple, :duration, :menu, :address, :alcoholic_drink, :decoration, :parking, presence: true
end
