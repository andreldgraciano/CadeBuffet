class RemoveColumnPaymentIdFromFromBuffets < ActiveRecord::Migration[7.1]
  def change
    remove_reference :buffets, :payment, foreign_key: true
  end
end
