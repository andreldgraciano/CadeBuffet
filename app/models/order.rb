class Order < ApplicationRecord
  belongs_to :buffet
  belongs_to :event
  belongs_to :client

  before_validation :generate_code, :set_order_vality

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(8)
  end

  def set_order_vality
    self.order_vality = Date.today + 7
  end
end
