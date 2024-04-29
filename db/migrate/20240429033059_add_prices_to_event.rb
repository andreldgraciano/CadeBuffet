class AddPricesToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :base_price, :integer, default: 5000
    add_column :events, :additional_per_person, :integer, default: 70
    add_column :events, :extra_hour, :integer, default: 1200
    add_column :events, :base_price_weekend, :integer, default: 9000
    add_column :events, :additional_per_person_weekend, :integer, default: 130
    add_column :events, :extra_hour_weekend, :integer, default: 2300
  end
end
