class Building < ApplicationRecord
  belongs_to :user
  has_many :units, dependent: :restrict_with_error  #删除building时如果unit存在则报错，用于数据保护
  serialize :excluded_floors, coder: JSON, default: []

  validates :building_no, presence: true, uniqueness: true
  validates :total_floors, numericality: { greater_than: 0, only_integer: true }
  validates :units_per_floor, numericality: { greater_than: 0, less_than_or_equal_to: 99, only_integer: true }
end
