class AddNumToRow < ActiveRecord::Migration[6.1]
  def change
    add_column :rows, :num, :integer
  end
end
