class RemoveDefaultValueFromEvent < ActiveRecord::Migration[7.1]
  def change
    change_column_default :events, :base_price, nil
    change_column_default :events, :additional_per_person, nil
    change_column_default :events, :extra_hour, nil
    change_column_default :events, :base_price_weekend, nil
    change_column_default :events, :additional_per_person_weekend, nil
    change_column_default :events, :extra_hour_weekend, nil
  end
end
