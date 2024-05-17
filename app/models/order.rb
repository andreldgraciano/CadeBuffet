class Order < ApplicationRecord
  belongs_to :buffet
  belongs_to :event
  belongs_to :client

  enum payment: { Cash: 0, Cash_and_Card: 1 }

  before_create :generate_code

  validates :event_day, :amount_people, presence: true

  validate :validate_event_day
  # validate :validate_order_vality_before_update

  private

  def generate_code
    self.code ||= SecureRandom.alphanumeric(8)
  end

  def validate_event_day
    if event_day.present? && event_day <= Date.today
      errors.add(:event_day, 'must be a future date')
    end
  end
end
