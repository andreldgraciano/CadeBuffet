class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :min_people
      t.integer :max_peaple
      t.integer :duration
      t.text :menu
      t.string :address
      t.string :alcoholic_drink
      t.string :decoration
      t.string :parking

      t.timestamps
    end
  end
end
