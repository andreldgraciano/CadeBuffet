class AddDiscountSurchargeTotalValueToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :discount, :decimal, default: 0
    add_column :orders, :surcharge, :decimal, default: 0
    add_column :orders, :total_value, :decimal, default: 0
  end
end
