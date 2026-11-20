class VisitPeriod < ApplicationRecord
  belongs_to :unit
  belongs_to :visit_schedule
  has_many :visit_logs, dependent: :destroy

  enum status: { pending: 0, in_progress: 1, completed: 2 }, default: :pending

  validates :period_start, presence: true
  validates :period_end, presence: true
  validates :due_at, presence: true
  validates :required_count,  numericality: { only_integer: true, greater_than: 0 }
end
