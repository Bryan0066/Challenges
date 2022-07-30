# frozen_string_literal: true

# crypt-of-civilization

# 1
crypt_of_civilization = []

crypt_of_civilization.push(
  'Comptometer',
  'Box of phonographic records',
  'Plastic savings bank',
  'Set of scales',
  'Toast-O-Lator',
  'Sample of aluminum foil',
  'Donald Duck doll'
)
puts crypt_of_civilization

# 2

extra = ['Container of soda', 'Lionel model train set', 'Ingraham pocket watch']

crypt_of_civilization.concat(extra)

puts crypt_of_civilization

# 3
# How many items are in the array?
length = crypt_of_civilization.length

# What is the first item in the array?
first = crypt_of_civilization[0]

# What is the last item in the array?
last = crypt_of_civilization.last

# What is the second item in the array?
second = crypt_of_civilization[1]

# What is the third item in the array?
third = crypt_of_civilization[2]

# What is the second from last item in the array?
second_to_last = crypt_of_civilization[-2]

# What is the index of "Toast-O-Lator"?
toast = crypt_of_civilization.index('Toast-0-Lator')

# 4
puts crypt_of_civilization.include?('Container of soda')
puts crypt_of_civilization.include?('Toast-O-Lator')
puts crypt_of_civilization.include?('Plastic bird')

# 5
# sort by word length
crypt_of_civilization.sort_by(&:length)

# sort in alphabetical order
crypt_of_civilization.sort

# two ways of sorting in reverse alphabetical order
crypt_of_civilization.sort.reverse

# 6
count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end

crypt_of_civilization.each do |item|
  puts item
end

# 7
crypt_of_civilization.shift
crypt_of_civilization.pop
crypt_of_civilization.delete('Set of scales')
crypt_of_civilization.delete('Sample of aluminum foil')
