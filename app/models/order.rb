class Order < ApplicationRecord
  belongs_to :buffet
  belongs_to :event
  belongs_to :client

  before_validation :generate_code

  validates :event_day, :amount_people, presence: true

  validate :validate_event_day

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(8)
  end

  def validate_event_day
    if event_day.present? && event_day <= Date.today
      errors.add(:event_day, 'deve ser uma data futura')
    end
  end
end
