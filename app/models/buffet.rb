class Buffet < ApplicationRecord
  belongs_to :payment
  belongs_to :buffet_profile
  has_many :events, -> { order(base_price: :asc) }, dependent: :destroy

  validates :brand_name, :corporate_name, :registration_number, :phone, :email, :address, :district, :state, :city, :zip_code, :description, :payment_id, :buffet_profile_id, presence: true

  private


end
