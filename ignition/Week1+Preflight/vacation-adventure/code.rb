# frozen_string_literal: true

adventure = 0
rand_int = rand(1..3)

if rand_int == 1
  adventure = 'dune sailing'
elsif rand_int == 2
  adventure = 'anti-gravity bounce-house'
elsif rand_int == 3
  adventure = 'lava surfing'
end

puts adventure
