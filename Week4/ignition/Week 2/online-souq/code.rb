# frozen_string_literal: true

# online-souq

require 'pry'

cart = []
not_available = []

items = ['old paperback book', 'potato', 'red onion', 'dried lemon', 'frankincense',
         'moon dust', 'saffron', 'glass spice jar', 'red fabric', 'orange fabric',
         'handicrafts', 'small persian rug', 'used medium space suit', 'heffalump shagrug',
         'woozle hide purse']

puts 'Welcome to Souq, the online marketplace!\n\n'
puts 'What is your name?'
name = gets.chomp
puts "Hello #{name}!\n\n"

puts "Here's a list of what we have in stock:"
items.each do |x|
  puts "* #{x}"
end
puts '\n\n'

loop do
  puts "What do you want to buy? (Type 'Finished' when done)"
  input = gets.chomp.downcase

  break if input == 'finished'

  if items.include?(input)
    cart.push(input)
  else
    puts "That item isn't available yet!"
    not_available.push(input)
  end
end

puts '\n\n'
puts "#{name} ,here is your shopping cart:\n\n"
cart.each do |x|
  puts " * #{x}"
end

puts '\n\n'

puts "Here's a list of what we didn't have and that you wanted, these should be avaialable soon!\n\n"

not_available.each do |thing|
  puts " * #{thing}"
end

puts ' \n\n'
