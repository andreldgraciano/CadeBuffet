class Buffet < ApplicationRecord
  belongs_to :buffet_profile
  has_many :events, -> { order(base_price: :asc) }, dependent: :destroy
  has_many :orders

  enum payment: { Cash: 0, Cash_and_Card: 1 }

  validates :brand_name, :corporate_name, :registration_number, :phone, :email, :address, :district, :state, :city, :zip_code, :description, :buffet_profile_id, :payment, presence: true
  validates :buffet_profile_id, :corporate_name, :brand_name, :email, :registration_number, :phone, :address, uniqueness: true

  private

end
