class CreateDependents < ActiveRecord::Migration[6.0]
  def change
    create_table :dependents do |t|
      t.string :relationship
      t.string :name
      t.string :email
      t.string :contact
      t.date :dob
      t.string :blood_group
      t.integer :height
      t.integer :weight

      t.timestamps
    end
    add_index :dependents, :email, unique: true
  end
end
