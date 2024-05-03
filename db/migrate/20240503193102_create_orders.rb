class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :buffet, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.date :event_day
      t.integer :amount_people
      t.text :details
      t.string :code
      t.string :venue
      t.string :status, default: 'Aguardando avaliação do buffet'
      t.date :order_vality

      t.timestamps
    end
  end
end
