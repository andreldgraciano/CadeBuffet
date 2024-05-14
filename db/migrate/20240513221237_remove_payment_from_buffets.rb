class RemovePaymentFromBuffets < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffets, :payment, :string
  end
end
