class AddVenuePreferenceToBuffet < ActiveRecord::Migration[7.1]
  def change
    add_column :buffets, :venue_preference, :string, default: 'exclusivamente no endereço do buffet'
  end
end
