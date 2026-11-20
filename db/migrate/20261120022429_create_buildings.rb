class CreateBuildings < ActiveRecord::Migration[8.1]
  def change
    create_table :buildings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :building_no, null: false
      t.integer :total_floor, null: false
      t.text :excluded_floor, null: false, default: "[]"
      t.integer :units_per_floor, null: false
      t.text :remark

      t.timestamps
    end
    add_index(:buildings, :building_no, unique: true)
  end
end
