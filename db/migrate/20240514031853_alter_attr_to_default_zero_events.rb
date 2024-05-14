class AlterAttrToDefaultZeroEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :base_price, :integer, default: 0
    change_column :events, :additional_per_person, :integer, default: 0
    change_column :events, :extra_hour, :integer, default: 0
    change_column :events, :base_price_weekend, :integer, default: 0
    change_column :events, :additional_per_person_weekend, :integer, default: 0
    change_column :events, :extra_hour_weekend, :integer, default: 0
  end
end
