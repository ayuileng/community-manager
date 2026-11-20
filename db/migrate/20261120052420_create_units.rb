class CreateUnits < ActiveRecord::Migration[8.1]
  def change
    create_table :units do |t|
      t.references :building, null: false, foreign_key: true
      t.references :visit_schedule, foreign_key: true
      t.string :unit_no, null: false
      t.integer :floor, null: false
      t.integer :unit_index, null: false
      t.boolean :active, null: false, default: true
      t.text :remark

      t.timestamps
    end
    add_index(:units, [:building_id, :unit_no], unique: true)
    add_index :units, [:building_id, :floor]
  end
end
