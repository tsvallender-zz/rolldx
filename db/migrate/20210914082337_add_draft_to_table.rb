class AddDraftToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :tables, :draft, :boolean, default: false
  end
end
