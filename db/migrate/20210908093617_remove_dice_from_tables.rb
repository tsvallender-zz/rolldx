class RemoveDiceFromTables < ActiveRecord::Migration[6.1]
  def change
    remove_column :tables, :dice, :integer
  end
end
