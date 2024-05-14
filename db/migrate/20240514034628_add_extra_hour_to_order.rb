class AddExtraHourToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :extra_hour, :integer
  end
end
