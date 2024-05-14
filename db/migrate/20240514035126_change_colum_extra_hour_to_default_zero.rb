class ChangeColumExtraHourToDefaultZero < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :extra_hour, :integer, default: 0
  end
end
