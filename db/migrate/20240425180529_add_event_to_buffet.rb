class AddEventToBuffet < ActiveRecord::Migration[7.1]
  def change
    add_reference :buffets, :event, null: false, foreign_key: true
  end
end
