class Event < ApplicationRecord
  belongs_to :buffet

  enum alcoholic_drink: { no_alcohol: 0, yes_alcohol: 1 }
  enum decoration: { no_decoration: 3, yes_decoration: 4 }
  enum parking: { no_parking: 0, yes_parking: 1 }
  enum venue_preference: { no_preference: 0, yes_preference: 1 }

  validates :name, :description, :min_people, :max_people, :duration, :menu, :address, :alcoholic_drink, :decoration, :parking, :venue_preference, :base_price, :additional_per_person, :value_extra_hour, :base_price_weekend, :additional_per_person_weekend, :value_extra_hour_weekend, presence: true
  validates :name, uniqueness: true
end
