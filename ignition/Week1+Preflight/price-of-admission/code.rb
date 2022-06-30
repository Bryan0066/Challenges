# frozen_string_literal: true

# part 1

def total_cost(adult_no, child_no)
  price_a = 120
  price_c = 40
  price_a * adult_no + price_c * child_no
end

total = total_cost(4, 2)
per_adult = total / 4
puts "Total Cost: $#{total}"
puts "Cost per adult: $#{per_adult}"

#========================
# part 2

PI = format('%.2f', Math::PI)
puts PI
