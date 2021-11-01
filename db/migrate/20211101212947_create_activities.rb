class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
