class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :web, :string
    add_column :users, :support, :string
    add_column :users, :itch, :string
    add_column :users, :name, :string
    add_column :users, :twitter, :string
  end
end
