class House < ApplicationRecord
    validates_presence_of :name, :source, :author

    has_many :members
end 