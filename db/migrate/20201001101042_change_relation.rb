class ChangeRelation < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :dependent_id, :integer
    add_column :histories, :user_id, :integer
    add_column :dependents, :user_id, :integer
    remove_column :histories, :dependent_email, :string
    remove_column :histories, :user_email, :string
    remove_column :dependents, :user_email, :string
  end
end
