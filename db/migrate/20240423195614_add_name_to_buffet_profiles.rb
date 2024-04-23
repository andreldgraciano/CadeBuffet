class AddNameToBuffetProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :buffet_profiles, :name, :string
  end
end
