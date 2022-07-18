
people = 
    {

    "Jon Smith" => {
        'age' => 25,
        'income' => 50000,
        'household_size' => 1,
        'gender' => 'male',
        'education' => 'college'
},

    "Jane Davies" => {
        'age' => 30,
        'income' => 60000, 
        'household_size' => 3,
        'gender' => "female",
        'education' => "high school"
},

    "Sam Farelly" => {
        'age' => 32,
        'income' =>80000,
        'household_size' => 2,
        'gender' => 'unspecified',
        'education' => "college"
},

    "Joan Favreau" => {
        'age' => 35,
        'income' => 65000,
        'household_size' => 4,
        'gender' => 'female',
        'education' => 'college'
},

    "Sam Mcnulty" => {
        'age' => 38,
        'income' => 63000,
        'household_size' => 3,
        'gender' => 'male',
        'education' => 'college'
},

    "Mark Minahan" => {
        'age' => 48,
        'income' => 78000,
        'household_size' => 5,
        'gender' => 'male',
        'education' => 'high school'
},
    
    "Susan Umai" => {
        'age' => 45,
        'income' =>75000,
        'household_size' => 2,
        'gender' => "female",
        'education' => 'college'
},
    
    "Bill Perault" => {
        'age' => 24,
        'income' =>45000,
        'household_size' => 1,
        'gender' => 'male',
        'education' => 'did not complete highschool'
},

    "Doug Stamper" => {
        'age' => 45,
        'income' => 75000,
        'household_size' => 1,
        'gender' => 'male',
        'education' => 'college'
},
    
    "Francis Underwood" => {
        'age' => 52,
        'income' =>100000,
        'household_size' => 2,
        'gender' => 'male',
        'education' => 'college'
},
    
}

#puts each instance of a specific property into a returned array
def grab_data (array,property)
    output = array.map{|x,y| array[x][property]}
end

#average of an array
def average (array)
    array.sum.to_f / array.length.to_f
end

#percentage of instances in a given array
def percent (array,property,input)
    counter = 0
    output = grab_data(array,property)
    output.each do |x|
        if x == input
            counter += 1
        end
    end
   counter.to_f / output.length.to_f * 100
end


puts "Average Age: #{average(grab_data(people,'age')).to_f}"
puts "Average Income: #{average(grab_data(people,'income'))}"
puts "Average Household Size: #{average(grab_data(people,'household_size'))}"
puts "Female %: #{percent(people,'gender','female').to_f}"
puts "Male %: #{percent(people,'gender','male').to_f}"
puts "Unspecified Gender %: #{percent(people,'gender','unspecified').to_f}"
puts "College %: #{percent(people,'education','college').to_f}"
puts "Highschool %: #{percent(people,'education','high school').to_f}"
puts "Did not Finish Highschool %:#{percent(people,'education','did not complete highschool').to_f} "
