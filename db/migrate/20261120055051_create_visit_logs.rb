class CreateVisitLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :visit_logs do |t|
      t.references :unit, null: false, foreign_key: true
      t.references :visit_period, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :visited_at, null: false
      t.text :content, null: false

      t.timestamps
    end
    add_index :visit_logs, [:unit_id, :visited_at]
    add_index :visit_logs, :visited_at
  end
end
