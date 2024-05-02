class AddPaymentToBuffets < ActiveRecord::Migration[7.1]
  def change
    add_column :buffets, :payment, :string
  end
end
