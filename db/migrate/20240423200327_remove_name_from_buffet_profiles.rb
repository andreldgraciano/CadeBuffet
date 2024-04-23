class RemoveNameFromBuffetProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffet_profiles, :name, :string
  end
end
