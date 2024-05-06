class AddDiscountDescriptionSurchargeDescriptionTotalValueToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :discount_description, :text
    add_column :orders, :surcharge_description, :text
  end
end
