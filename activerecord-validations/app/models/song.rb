class Song < ActiveRecord::Base

    validates :year, presence: true 
    validates :year, numericality: true, length: { in: 2..4 }
    # length: {minimum:2, maximum:4}

    validates :title, presence: true
    validates :title, length: { in: 1..15}

    validates :artist, presence: true
    validates :artist, numericality: false, length: {in: 1..15}

    validates :album, presence: true
    validates :album, numericality: false, length: {in: 1..15}

    validates :track_number, numericality: true
    validates :track_number, length: {in: 1..50}

    validates :genre, presence: true
    validates :genre, numericality: false, length: {in: 1..15}

    validates :length_in_seconds, presence: true
    validates :length_in_seconds, numericality: true
 
end
