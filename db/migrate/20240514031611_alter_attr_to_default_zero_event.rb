class AlterAttrToDefaultZeroEvent < ActiveRecord::Migration[7.1]
  def change
    change_column_default :events, :base_price, default: 0
    change_column_default :events, :additional_per_person, default: 0
    change_column_default :events, :extra_hour, default: 0
    change_column_default :events, :base_price_weekend, default: 0
    change_column_default :events, :additional_per_person_weekend, default: 0
    change_column_default :events, :extra_hour_weekend, default: 0
  end
end
