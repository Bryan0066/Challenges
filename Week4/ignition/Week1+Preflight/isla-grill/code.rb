# frozen_string_literal: true

dinner_price = 178
tip = 0.20

def total_and_tip(total, tip)
  total = (total * tip) + total
end

puts "The total bill: $#{format('%.2f', total_and_tip(dinner_price, tip))}"
puts "20% tip: $#{format('%.2f', tip *= dinner_price)}"
