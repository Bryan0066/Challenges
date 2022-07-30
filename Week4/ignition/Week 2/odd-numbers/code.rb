# frozen_string_literal: true

# odd-numbers

# puts odd numbers in a given range

(1..100).each do |x|
  puts x unless x.even?
end
