class AddDescriptionToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :description, :text
  end
end
