class ChangeContactToStringInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :contact, :string
    add_column :users, :blood_group, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
  end
end
