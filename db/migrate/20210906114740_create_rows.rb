class CreateRows < ActiveRecord::Migration[6.1]
  def change
    create_table :rows do |t|
      t.string :name
      t.text :description
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
