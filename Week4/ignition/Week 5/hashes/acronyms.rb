# file: acronyms.rb
require "pry"

acronyms = {
  "EST" => "Eastern Standard Time",
  "EOF" => "End of File",
  "SSN" => "Social Security Number",
  "UFO" => "Unidentified Flying Object",
  "NASA" => "National Aeronautics and Space Administration",
  "MTV" => "Music Television",
  "DAEMON" => "Disk And Execution Monitor"
}

acronyms.each do |key, value|
  puts "#{key}: #{value}"
end

#binding.pry

puts acronyms.keys.join(',')


if acronyms.has_key?("BLT")
  puts acronyms["BLT"]
else
  puts "I don't know that one!"
end

if acronyms["BLAT"]
  puts acronyms["BLAT"]
else
  puts "I don't know that one!"
end