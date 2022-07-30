#  Write Ruby<->English answers here as comments in your code

# 1)
# * numbers is an array
# numbers.each do |number|
#   puts 3 * number
# end
## for each number in the array, puts 3 times that number.

# 2)
# * names is an array
# names.each do |name|
#   puts name.length
# end
## for each name in the array, puts the length of the name.

# 3)
# * numbers is an array
# sum = 0
# numbers.each do |number|
#   sum += number
# end
# puts sum
## for each number in the array, add it to 'sum'. Then, puts the 'sum'.

# 4)
# * hash is a hash
# hash.each do |name, age|
#   puts "#{name} is #{age} years old."
# end
##
## for each key name-age pair, puts them with this format "name is age years old".

# 5)
# * account is a hash
# sum = 0
# account.each do |transaction, value|
#   sum += value
# end
# puts "The value the account is #{sum}"
## for each transaction-value pair, sum the values. Then puts the total value.

# 6)
# * addresses is a hash
# addresses.each do |name, address|
#   puts "#{name} lives on #{address}"
# end
## for each name-address pair, puts them within "name lives on address"

#  Write English<->Ruby answers here as comments in your code

# 1. `For every element 'word' in the array 'sentences' print out the word.`

# 
# * sentences.each do |word|
#   puts word
#   end
#

# 2. `For every element 'phone_number' in the array 'numbers' print out the phone number if it is a MA area code.`

# * ma_area_codes = []
#   numbers.each do |phone_number|
#   if ma_area_codes.include? number / 100,000
#       puts number
#   end
#

# 3. `For every element number in the array 'numbers' print out every odd number.`


# * numbers.each do |number|
#   if number % 2 != 0
#       puts number
#   end
#   end
#

# 4. `For every name-age pair in the hash 'ages', print out each pair.`

# * ages.each do |name,age|
#     puts `#{name}#{age}`
#   end
#


# 5. `For every name-age pair in the hash 'ages', print out a pair if the age is > 10.`

# * ages.each do |name,age|
#   if age > 10
#     puts `#{name}#{age}`
#   end
#   end
#


# 6. `For every name-age pair in the hash 'ages', print out a pair if the age is even.`

# * ages.each do |name,age|
#   if age % 2 == 0
#     puts `#{name}#{age}`
#   end
#

=begin
# Write Ruby code to find out the answers to the following questions:
array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# * What is the sum of all the numbers in `array`?
sum = 0

array.each do |number|
    sum += number
end
puts sum
# * How would you print out each value of the array?
array.each do |number|
    puts number
end

# * What is the sum of all of the even numbers?
sum_even = 0
array.each do |number|
  if number % 2 == 0
    sum_even += number
  end
end
puts sum_even

# * What is the sum of all of the odd numbers?

sum_odd = 0
array.each do |number|
  if number % 2 != 0
    sum_odd += number
  end
end
puts sum_odd

# * What is the sum of all the numbers divisble by 5?

sum_five = 0
array.each do |number|
  if number % 5 != 0
    sum_five += number
  end
end
puts sum_five

# * What is the sum of the squares of all the numbers in the array?
sum_square = 0
array.each do |number|
  if number % 5 != 0
    sum_square += number ** 3
  end
end
puts sum_square

=end

# Write Ruby code to find out the answers to the following questions:

array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# * How would you print out each name backwards in `array`?

array.each do |name|
    puts name.reverse
end

# * What are the total number of characters in the names in `array`?
sum = 0
array.each do |name|
    sum += name.length
end
puts sum

# * How many names in `array` are less than 5 characters long?
sum_five = 0
array.each do |name|
    if name.length < 5
      sum_five += 1
    end
end
puts sum_five

# * How many names in `array` end in a vowel?

vowels = 'aeiou'
vowels_array = vowels.split()
puts vowels_array

sum_value = 0
array.each do |name|
    vowels_array.each do|a|
        if name.end_with? a 
            sum_value += 1
        end
    end
end
puts sum_value

# * How many names in `array` are more than 5 characters long?

sum_greater_five = 0
array.each do |name|
    if name.length > 5
      sum_greater_five += 1
    end
end
puts sum_greater_five
# * How many names in `array` are exactly 5 characters in length?

sum_equal_five = 0
array.each do |name|
    if name.length == 5
      sum_equal_five += 1
    end
end
puts sum_equal_five