# frozen_string_literal: true

# supply_list =  "Spaceship Supply List\n"
# supply_list += "------------\n"
#
# response = ""
# while response != 'done'
#     puts "Enter supply item. Type 'done' when finished."
#     response = gets.chomp
#
#     if response != 'done'
#         supply_list += "- #{response} \n"
#     end
# end
#
#
# print the supply list
#
# puts supply_list
#
# part 2
#-----------------

cost = 0
response = ''
while response != 'done'
  puts "Current cost: $#{cost}"
  puts "Enter supply cost, or 'done' if finished.\n"
  response = gets.chomp

  if response != 'done'
    response = response.to_i
    cost += response
  end
end

puts "\n\n"
puts "Final cost: #{cost}"
# print the final total cost
