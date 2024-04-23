class RemoveBuffetIdFromBuffetProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffet_profiles, :buffet_id, :string
  end
end
