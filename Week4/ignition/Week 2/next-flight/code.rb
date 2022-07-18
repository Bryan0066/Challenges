# frozen_string_literal: true

# NOTE: second submission of next-flight was an accident, please ignore.
require 'pry'

array = [
  ['Flight 1', 2],
  ['Flight 2', 5],
  ['Flight 3', 7.5],
  ['Flight 4', 8.5],
  ['Flight 5', 9],
  ['Flight 6', 10],
  ['Flight 7', 11.5],
  ['Flight 8', 13.5],
  ['Flight 9', 14.5],
  ['Flight 10', 17],
  ['Flight 11', 18],
  ['Flight 12', 19],
  ['Flight 13', 24]
]

# creating variable 'old_diff' for use in while loop
old_diff = 100

loop do
  puts 'When would you like to depart?'
  input = gets.chomp.to_f

  # checking for bad input. input cannot be 0 since string.to_f = 0
  if (input.is_a? Float) && input.positive? && input <= 24

    array.each do |flight_number, flight_time|
      diff = input - flight_time
      diff = diff.abs

      if diff <= old_diff
        @flight_chosen = flight_number
        @flight_chosen_time = flight_time
        puts "You're in luck! We have a flight for that time." if diff.zero?
      end

      old_diff = diff
    end
    break

  else
    puts "\n\nI dont understand that time, please re-enter your time.\n\n"

  end
end

puts "Your closest flight time is #{@flight_chosen} which departs at #{@flight_chosen_time}."
