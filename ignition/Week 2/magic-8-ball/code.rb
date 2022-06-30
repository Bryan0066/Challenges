# frozen_string_literal: true

# magic-8-ball
# hello
responses = [
  'It is certain',
  'It is decidedly so',
  'Without a doubt',
  'Yes, definitely',
  'You may rely on it',
  'As I see it, yes',
  'Most likely',
  'Outlook good',
  'Yes',
  'Signs point to yes',
  'Reply hazy try again',
  'Ask again later',
  'Better not tell you now',
  'Cannot predict now',
  'Concentrate and ask again',
  "Don't count on it",
  'My reply is no',
  'My sources say no',
  'Outlook not so good',
  'Very doubtful'
]
# Confirm the correct number of responses have been stored by printing the number to the console (`20`)
puts responses.length

# Ask the user what their question is, and store it as a variable called `question`
puts "What is your question?\n"
gets.chomp

# Output a random response to the user's question
puts responses[rand(0..(responses.length - 1))]
puts "\n\n"

# Output the number of responses that include the word "yes"
# use .map here instead<<<<<<<<<<
puts "Here are all the responses with the word 'yes' \n\n"

responses.each do |x|
  puts " * #{x}" if x.downcase.include?('yes')
end

puts "\n\n"

# Output the number of responses that include the words "no" or "not"
puts "Here are all the responses with the word 'no' or 'not' \n\n"

responses.each do |x|
  puts " * #{x}" if x.downcase.include?('no') || x.downcase.include?('not')
end

puts "\n\n"

# Output the alphabetized list of responses
puts responses.sort

# Output the first and last responses from the alphabetized list
a_z = responses.sort
puts "\n\nLast in list: #{a_z.last} \nFirst in list: #{a_z.first}"

# Add 1 response of your choosing to the current list
responses.push("Things aren't looking so good")

# Concat an array of 3 additional responses to the current list
responses.concat(['not sure tbh', 'i dont like that question', 'what?'])

# Confirm the correct number of responses have been stored by printing the number to the console (`24`)
puts responses.length
