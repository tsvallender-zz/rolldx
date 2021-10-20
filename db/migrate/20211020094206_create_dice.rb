class CreateDice < ActiveRecord::Migration[6.1]
  def change
    create_table :dice do |t|
      t.text :name
      t.integer :numbers, array: true, default: []

      t.timestamps
    end
  end
end
