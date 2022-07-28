class Recipe < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many(:comments)
end