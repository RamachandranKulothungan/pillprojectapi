class RemoveRelations < ActiveRecord::Migration[6.0]
  def change
    remove_column :histories, :dependent_id, :integer
    remove_column :histories, :user_id, :integer
    remove_column :dependents, :user_id, :integer
  end
end
