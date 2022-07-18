transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions. Be sure to make sure that your output and format matches what is given on the assignment page:

# * What is the value of the first transaction?
puts "The first transaction is: #{transactions[0].to_s.gsub("\_", " ")}"

# * What is the value of the second transaction?
puts "The second transaction is: #{transactions[1].to_s.gsub("\_", " ")}"

# * What is the value of the fourth transaction?
puts "The fourth transaction is: #{transactions[3].to_s.gsub("\_", " ")}"

# * What is the value of the last transaction?
puts "The last transaction is: #{transactions[-1].to_s.gsub("\_", " ")}"

# * What is the value of the second from last transaction?
puts "The second from the last transaction is: #{transactions[-2].to_s.gsub("\_", " ")}"

# * What is the value of the 5th from last transaction?
puts "The fifth from the last transaction is: #{transactions[-6].to_s.gsub("\_", " ")}"

# * What is the value of the transaction with index 5?
puts "The transaction with the index of 5 is: #{transactions[5].to_s.gsub("\_", " ")}"

# * How many transactions are there in total?
puts "The total number of transactions is: #{transactions.length}"

# * How many positive transactions are there in total?
sum_positive = 0
transactions.each do |number|
   if number > 0
    sum_positive += 1
   end
end
puts "The total number of positive transactions is: #{sum_positive}"

# * How many negative transactions are there in total?
sum_negative = 0
transactions.each do |number|
   if number < 0
    sum_negative += 1
   end
end
puts "The total number of negative transactions is: #{sum_negative}"

# * What is the largest withdrawal?
puts "The largest withdrawal is:#{transactions.min}"

# * What is the largest deposit?
puts "The largest deposit is:#{transactions.max}"

# * What is the smallest withdrawal?
number_set = transactions.min
transactions.each do |number|
    if number < 0
      if number > number_set
        number_set = number
      end
    end
end
puts "The smallest withdrawal is: #{number_set}"

# * What is the smallest deposit?

smallest_deposit = transactions.max
transactions.each do |number|
    if number > 0
      if number < smallest_deposit
        smallest_deposit = number
      end
    end
end
puts "The smallest deposit is: #{smallest_deposit}"


# * What is the total value of all the transactions?
sum_all = 0
transactions.each do |number|
    sum_all += number
end
puts "The total value of all the transactions is: #{sum_all}"

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his all of the transactions in our transactions array have been run?
puts "Dr. Dre's balance is: #{sum_all + 239900}"

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts "Total records: #{best_records.length}"
puts ""
# * Who are all the artists listed?

puts "All of the artists: #{}"
best_records.each do |name, albums| 
    puts name
end
puts""
# * What are all the album names in the hash?
puts "All of the albums:"

best_records.each do |name, albums| 
    puts albums
end
puts""
# * Delete the `Eminem` key-value pair from the list and print an updated list of just the artists.

best_records.delete('Eminem')

puts "List of artists with Eminem deleted:"
best_records.each do |name, albums| 
    puts albums
end
puts ""
# * Add your favorite musician and their best album to the list and print an updated list of all the artists and albums:

best_records['Red Hot Chillie Peppers'] = 'Californication'

puts "My favorite musician added:"
best_records.each do |name, albums| 
    puts "#{name}, #{albums}"
end
puts ""

# * True or False: `Nirvana` is included in `best_records`
puts "True or False: `Nirvana` is included: #{best_records.include?("Nirvana")}"

# * Change `Nirvana`'s album to another and then print the updated list of Artists and Albums.

best_records["Nirvana"] = "In Utero"

puts "Nirvana's album updated:"
best_records.each do |name, albums| 
    puts "#{name}, #{albums}"
end
puts ""

# * True or False: `Soundgarden` is included in `best_records`?
puts "True or False: `Soundgarden` is included: #{best_records.include?('Soundgarden')}"
puts ""

# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band and then print the updated list of Artists and Albums.

best_records["Soundgarden"] = "Superunknown"

puts "Soundgarden added if it's not already there:"
best_records.each do |name, albums| 
    puts "#{name}, #{albums}"
end

puts ""
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts "key-value pairs have a key that has a length less than or equal to 6 characters:"

best_records.each do |name, albums| 
    key_length = name.length
    if key_length <= 6
    puts "#{name}, #{albums}"
    end
end

# * Which key-value pairs have a value that is greater than 10 characters?
puts "key-value pairs that have a value that have a length greater than 10 characters:"

best_records.each do |name, albums| 
    albums_length = albums.length
    if albums_length > 10
    puts "#{name}, #{albums}"
    end
end