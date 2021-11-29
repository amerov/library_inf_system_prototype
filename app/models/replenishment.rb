class Replenishment < ApplicationRecord
  belongs_to :foundation
  belongs_to :employee
  belongs_to :type
  validates :name, :type, :publisher, :items_count, presence: true
end
