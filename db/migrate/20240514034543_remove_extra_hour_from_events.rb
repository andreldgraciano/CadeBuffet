class RemoveExtraHourFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :extra_hour, :integer
  end
end
