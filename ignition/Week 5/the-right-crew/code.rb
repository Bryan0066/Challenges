REQUIRED_CREW_SIZE = 6

available_crew = [
  :captain,
  :first_mate,
  :second_mate,
  :navigator,
  :first_engineer,
  :info_systems_tech,
  :environmental_control_tech,
  :lead_maintenance,
  :first_medical,
  :first_food_ops,
  :combat_systems_officer
]

possible_crew_selections = available_crew.sample(REQUIRED_CREW_SIZE)


possible_crew_selections.each do |selection|
  puts "#{selection.to_s.gsub("_", " ")} selected!"
end

puts ""

[
  :captain,
  :navigator,
  :lead_maintenance
].each do |required_crew|
  if !possible_crew_selections.include?(required_crew)
    puts "WARNING! You will be without a #{required_crew.to_s.gsub("_", " ")}!"
  end
end
