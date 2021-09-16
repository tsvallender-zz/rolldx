class AddPrivateToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :private, :boolean, default: false
  end
end
