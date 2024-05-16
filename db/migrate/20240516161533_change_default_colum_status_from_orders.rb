class ChangeDefaultColumStatusFromOrders < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :status, :string, default: "Waiting for buffet review"
  end
end
