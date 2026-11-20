class VisitSchedule < ApplicationRecord

    enum(:period_unit,  { week: 0, month: 1, quarter: 2 },   default: :week )
    validates :name, presence: true, uniqueness: true
    validates :period_unit, presence: true
    validates :times_per_period, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
    validates :remind_days_before, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

    PERIOD_LABELS = { "week" => "每周", "month" => "每月", "quarter" => "每季度" }.freeze
end
