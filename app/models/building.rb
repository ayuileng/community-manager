class Building < ApplicationRecord
  belongs_to :user
  has_many :units, dependent: :destroy  
  serialize :excluded_floor, coder: JSON, default: []

  validates :building_no, presence: true, uniqueness: true
  validates :total_floor, numericality: { greater_than: 0, only_integer: true }
  validates :units_per_floor, numericality: { greater_than: 0, less_than_or_equal_to: 99, only_integer: true }
end
