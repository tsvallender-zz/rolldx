class AddPrivateToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :private, :boolean, default: false
  end
end
