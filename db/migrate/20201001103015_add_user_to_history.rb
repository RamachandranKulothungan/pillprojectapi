class AddUserToHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :user_id, :integer
  end
end
