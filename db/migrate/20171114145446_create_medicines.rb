class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :strength
      t.string :doctor
      t.string :how_to_refill
      t.integer :rx_number
      t.integer :dose_number
      t.string :dose_instructions
      t.integer :number_in_bottle
      t.datetime :refill_date
      t.integer :user_id
    end
  end
end
