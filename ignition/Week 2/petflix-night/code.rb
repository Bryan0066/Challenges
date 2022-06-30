# frozen_string_literal: true

# petflix-night

dramas = [
  'Stanger Llamas',
  'Game of Bones',
  'Llama Actually',
  "Grey's Catanomy",
  'Breaking Baaaaahhhd'
]

animations = [
  'Bojack Man',
  'Family Dog',
  'Futurellama',
  'Barkcher',
  'American Dog',
  'Pokemon',
  "Bob's Barkers"
]

comedies = [
  'Barks and Recreation',
  '30 Cats',
  'Bones',
  'Girl meets Cat',
  'Gilmore Cats',
  'New Dog',
  'Catlandia',
  'Full Mouse'
]

all_shows = [
  'Stanger Llamas',
  'Game of Bones',
  'Llama Actually',
  "Grey's Catanomy",
  'Breaking Baaaaahhhd',
  'Bojack Man',
  'Family Dog',
  'Futurellama',
  'Barkcher',
  'American Dog',
  'Pokemon',
  "Bob's Barkers",
  'Barks and Recreation',
  '30 Cats',
  'Bones',
  'Girl meets Cat',
  'Gilmore Cats',
  'New Dog',
  'Catlandia',
  'Full Mouse'
]

# 1
llama_drama = dramas.select { |show| show.downcase.include?('llama') }
puts llama_drama
puts '\n\n'

# 2
dog_anamation = animations.select { |show| show.downcase.include?('dog') }
puts dog_anamation
puts '\n\n'

# 3
cat_comedy = comedies.reject { |show| show.downcase.include?('cat') }
puts cat_comedy
puts '\n\n'

# 4

all_shows_sorted = all_shows.map { |show| show[0] }
puts all_shows_sorted
