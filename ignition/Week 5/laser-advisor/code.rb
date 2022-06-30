# your code, here

lasers = {
"blaster" => 200,
"helium_neon" => 180,
"nuclear_pumped" => 170,
"krypton" => 170,
"co2" => 160,
"coil" => 150,
"strontium_vapor" => 140,
"ruby" => 130,
"xenon_ion" => 120,
"free_electron" => 110,
"gas_dynamic" => 95,
"nitrogen" => 0
}

puts("How far away is the target?")
input = gets.chomp
input = input.to_i
lasers.sort.to_h

lasers.each do |name, min_range|
    laser_choice = name
    if input > min_range
        puts "You should use the #{name.to_s.gsub("\_", " ")} laser!"
        break
    end
    
end
