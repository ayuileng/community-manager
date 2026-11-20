class VisitLog < ApplicationRecord
  belongs_to :unit
  belongs_to :visit_period
  belongs_to :user

  validates :visited_at, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
