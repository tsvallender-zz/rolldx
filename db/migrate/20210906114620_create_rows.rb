class CreateRows < ActiveRecord::Migration[6.1]
  def change
    create_table :rows do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
