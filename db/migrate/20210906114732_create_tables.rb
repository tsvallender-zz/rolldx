class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :dice

      t.timestamps
    end
  end
end
