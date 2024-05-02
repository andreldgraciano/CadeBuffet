class DropTablePayments < ActiveRecord::Migration[7.1]
  def change
    drop_table :payments
  end
end
