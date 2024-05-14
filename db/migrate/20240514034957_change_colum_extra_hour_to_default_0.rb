class ChangeColumExtraHourToDefault0 < ActiveRecord::Migration[7.1]
  def change
    change_column_default :orders, :extra_hour, default: 0
  end
end
