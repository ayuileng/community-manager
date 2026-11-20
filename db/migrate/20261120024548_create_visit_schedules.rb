class CreateVisitSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :visit_schedules do |t|
      t.string :name, null: false
      t.integer :period_unit, null: false
      t.integer :times_per_period, null: false
      t.integer :remind_days_before, null: false
      t.text :description
      t.boolean :active, null: false

      t.timestamps
    end

    add_index(:visit_schedules, :name, unique: true)
  end
end
