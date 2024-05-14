class ChangeNameColumPaymentsBuffet < ActiveRecord::Migration[7.1]
  def change
    rename_column :buffets, :payment_credito, :payment_credit
    rename_column :buffets, :payment_debito, :payment_debit
  end
end
