class Foundation < ApplicationRecord
  belongs_to :lib, optional: false
  validates :books_count, :journals_count, :newspapers_count, :collections_count, :dissertations_count, :reports_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
