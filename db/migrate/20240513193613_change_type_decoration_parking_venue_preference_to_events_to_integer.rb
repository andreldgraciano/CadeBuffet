class ChangeTypeDecorationParkingVenuePreferenceToEventsToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :decoration, :integer, default: 0
    change_column :events, :parking, :integer, default: 0
    change_column :events, :venue_preference, :integer, default: 0
    change_column_default :events, :alcoholic_drink, from: nil, to: 0
  end
end
