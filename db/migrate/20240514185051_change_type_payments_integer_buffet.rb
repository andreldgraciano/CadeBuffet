class ChangeTypePaymentsIntegerBuffet < ActiveRecord::Migration[7.1]
  def change
    change_column :buffets, :payment_pix, :integer, default: 0
    change_column :buffets, :payment_credit, :integer, default: 0
    change_column :buffets, :payment_debit, :integer, default: 0
  end
end
