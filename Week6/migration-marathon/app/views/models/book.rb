class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :favorite, presence: true, allow_nil: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, allow_nil: true }
end