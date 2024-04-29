class RemoveVenuePreferenceFromBuffet < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffets, :venue_preference, :string
  end
end
