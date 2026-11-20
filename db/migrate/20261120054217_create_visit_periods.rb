class CreateVisitPeriods < ActiveRecord::Migration[8.1]
  def change
    create_table :visit_periods do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :visit_schedule, null: false, foreign_key: true
      t.date :period_start, null: false
      t.date :period_end, null: false
      t.date :due_at, null: false
      t.integer :required_count, null: false
      t.integer :completed_count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :remind_days_before, null: false
      t.datetime :completed_at

      t.timestamps
    end
    add_index :visit_periods,[:unit_id,:period_start],unique: true
    add_index :visit_periods,[:status,:due_at]
    add_index :visit_periods,:period_start
    add_index :visit_periods,:period_end
  end
end
