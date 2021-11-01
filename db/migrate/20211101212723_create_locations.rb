class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.references :tour, null: false, foreign_key: true
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end
