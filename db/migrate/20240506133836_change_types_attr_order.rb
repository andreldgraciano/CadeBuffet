class ChangeTypesAttrOrder < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :discount, :integer, default: 0
    change_column :orders, :surcharge, :integer, default: 0
    change_column :orders, :total_value, :integer, default: 0
  end
end
