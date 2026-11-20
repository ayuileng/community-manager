class Unit < ApplicationRecord
  belongs_to :building
  belongs_to :visit_schedule, optional: true
  has_many :visit_periods, dependent: :destroy
  has_many :visit_logs, dependent: :destroy

  validates :unit_no, presence: true, uniqueness: { scope: :building_id }  #仅在相同的building_id下保证unit_no唯一
  validates :floor, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_index, numericality: { only_integer: true, greater_than: 0 }

end
