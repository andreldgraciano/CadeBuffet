class ChangePaymentToIntegerDefaultZero < ActiveRecord::Migration[7.1]
  def change
    change_column :buffets, :payment, :integer, default: 0
  end
end
