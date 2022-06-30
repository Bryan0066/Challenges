require "pry"
require_relative "theater"

theater = Theater.new(45)

theater.admit!(40)
puts theater.at_capacity?

theater.admit!(5)
puts theater.at_capacity?

binding.pry
