class Employee < ApplicationRecord
  belongs_to :lib
  enum education: { secondary: 'secondary', secondary_special: 'secondary_special', higher: 'higher' }, _prefix: true
  validates :full_name, :position, :birthdate, :joined_at, :education, :salary, presence: true
end
