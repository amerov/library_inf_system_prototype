class Lib < ApplicationRecord
  has_one :foundation
  validates :name, :address, :city, presence: true
end
