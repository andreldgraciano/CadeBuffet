class ChangeTypeAlcoholicDrinkToEventsToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :alcoholic_drink, :integer
  end
end
