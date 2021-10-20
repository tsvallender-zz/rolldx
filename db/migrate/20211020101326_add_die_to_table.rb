class AddDieToTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :tables, :die, null: false, foreign_key: true
  end
end
