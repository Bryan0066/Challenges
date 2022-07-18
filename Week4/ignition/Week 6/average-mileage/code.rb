def average(mileage_list)
  sum = 0
  mileage_list.each do |mileage|
    sum += mileage
  end

  sum / mileage_list.size.to_f
end

Flying_Dutchman_mileages = [260, 483, 792, 357, 546].freeze
Flying_Dutchman_average = average(Flying_Dutchman_mileages)
puts Flying_Dutchman_average

def mileage_rating(average)
  if average >= 1000
    'A - Toyota Prius'
  elsif average >= 750
    'B '
  elsif average >= 500
    'C'
  elsif average >= 250
    'D'
  else
    'F - G wagon'
  end
end

Flying_Dutchman_mileage_rating = mileage_rating(Flying_Dutchman_average)
puts Flying_Dutchman_mileage_rating

def rankings(ships)
  ships.each_with_index do |ship, index|
    puts "#{index + 1}. #{ship}"
  end
end

rankings(['Nanoship', 'Flying_Dutchman', 'Snacky Cabs', 'Resisty\'s Ship', 'Zhook Cruiser'])
