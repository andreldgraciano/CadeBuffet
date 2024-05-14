class RemoveTypePaymentsAndAddPaymentsToBuffets < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffets, :payment_pix, :integer
    remove_column :buffets, :payment_credit, :integer
    remove_column :buffets, :payment_debit, :integer
    add_column :buffets, :payment, :string
  end
end
