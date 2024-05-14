class ChangeTypePaymentsBuffet < ActiveRecord::Migration[7.1]
  def change
    change_column :buffets, :payment_pix, :string, default: '0'
    change_column :buffets, :payment_credit, :string, default: '0'
    change_column :buffets, :payment_debit, :string, default: '0'
  end
end
