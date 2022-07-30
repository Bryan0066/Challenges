class Review < ApplicationRecord
  validates :rating, presence: true
  validates :body, presence: true

  belongs_to :restaurant
end
