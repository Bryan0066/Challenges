class Member < ApplicationRecord
  validates :first_name, presence: true 
  validates :last_name, presence: true

  belongs_to :house

  def name
    "#{first_name} #{last_name}"
  end
end