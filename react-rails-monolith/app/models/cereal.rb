class Cereal < ApplicationRecord

    validates :name, presence: true
    validates :brand, presence: true

end