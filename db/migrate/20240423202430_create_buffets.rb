class CreateBuffets < ActiveRecord::Migration[7.1]
  def change
    create_table :buffets do |t|
      t.string :brand_name
      t.string :corporate_name
      t.integer :registration_number
      t.integer :phone
      t.string :email
      t.string :address
      t.string :district
      t.string :state
      t.string :city
      t.integer :zip_code
      t.text :description
      t.references :payment, null: false, foreign_key: true
      t.references :buffet_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
