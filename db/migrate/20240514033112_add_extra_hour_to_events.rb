class AddExtraHourToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :extra_hour, :integer, default: 0
  end
end
