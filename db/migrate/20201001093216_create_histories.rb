class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.string :illness
      t.string :doctor
      t.string :medicines
      t.date :start_date
      t.date :end_date
      t.integer :dosage_amount
      t.integer :dosage_frequency
      t.time :dosage_time
      t.boolean :notification

      t.timestamps
    end
  end
end
