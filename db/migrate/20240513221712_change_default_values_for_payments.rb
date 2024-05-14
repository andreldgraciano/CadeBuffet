class ChangeDefaultValuesForPayments < ActiveRecord::Migration[7.1]
  def change
    change_column :buffets, :payment_pix, :integer, default: 0
    change_column :buffets, :payment_credito, :integer, default: 0
    change_column :buffets, :payment_debito, :integer, default: 0
  end
end
