class AddBuffetRefToBuffetProfile < ActiveRecord::Migration[7.1]
  def change
    add_reference :buffet_profiles, :buffet, null: false, foreign_key: true
  end
end
