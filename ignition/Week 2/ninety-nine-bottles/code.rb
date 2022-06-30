# frozen_string_literal: true

# ninety-nine-bottles

require 'pry'

bottles = 99

while bottles >= 0

  if bottles.zero?

    puts "No more bottles of beer on the wall, no more bottles of beer. \n"  \
         "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  elsif bottles == 1

    puts "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer.\n" \
         "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n\n"

  elsif bottles == 2

    puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
         "Take one down and pass it around, #{bottles - 1} bottle of beer on the wall."

  elsif ((bottles - 1) % 10).zero?

    puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
         "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall!\n\n"

  elsif bottles % 10 != 0

    puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
         "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"

  end
  # bottles increment
  bottles -= 1
end
