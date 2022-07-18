# frozen_string_literal: true

# supply_list

supply_list =  "Spaceship Supply List\n"
supply_list += "------------\n"

input = ''
while input != 'done'
  print "Please enter a supply (or 'done'): "
  input = gets.chomp
  supply_list += "* #{input}\n" if input != 'done'
end

puts "\n\n"
puts supply_list
