class Order < ApplicationRecord
  belongs_to :buffet
  belongs_to :event
  belongs_to :client

  before_validation :generate_code

  validates :event_day, :amount_people, presence: true

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(8)
  end
end
