# frozen_string_literal: true

require pry

items = ['chips', 'popcorn', 'skittles', 'granola', 'mentos', 'gum', 'cheetos', 'm&ms']

puts 'Which item do you want?'
choice = gets.chomp
choice_index = items.index(choice)

puts items.include?(choice) === true ? "Index of choice: #{choice_index}." : 'Not available, sorry!'
