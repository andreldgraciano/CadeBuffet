class AlterNamesAttrEvents < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :extra_hour, :value_extra_hour
    rename_column :events, :extra_hour_weekend, :value_extra_hour_weekend
  end
end
