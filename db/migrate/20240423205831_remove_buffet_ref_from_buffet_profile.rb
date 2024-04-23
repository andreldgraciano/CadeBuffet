class RemoveBuffetRefFromBuffetProfile < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffet_profiles, :buffet, :string
  end
end
