class AddDependentToHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :dependent_id, :integer
  end
end
