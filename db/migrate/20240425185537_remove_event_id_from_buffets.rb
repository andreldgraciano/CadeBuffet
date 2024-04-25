class RemoveEventIdFromBuffets < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffets, :event_id, :string
  end
end
