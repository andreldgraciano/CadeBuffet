class AddPaymentColumnsToBuffets < ActiveRecord::Migration[7.1]
  def change
    add_column :buffets, :payment_pix, :boolean
    add_column :buffets, :payment_credito, :boolean
    add_column :buffets, :payment_debito, :boolean
  end
end
