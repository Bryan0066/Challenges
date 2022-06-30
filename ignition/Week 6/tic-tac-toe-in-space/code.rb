board_a = [
    ['x', 'o', 'x'],
    ['x', nil, 'o'],
    ['x', 'o', nil]
  ]

board_b = [
    [nil, 'o', 'x'],
    ['x', 'o', nil],
    ['x', 'o', nil]
  ]

def print_grid(matrix)
  i = 0
  matrix.each do |array|
    array.each_with_index do |element, index|
        new_array = []
      if !element
        array[index] = " " 
      end
    end
    if i != 0 && i <= 2
      puts "---------"
    end
    puts "#{array[0]} | #{array[1]} | #{array[2]} "
    i += 1
  end
end
puts "\nBoard A:"
print_grid(board_a)
puts "\nBoard B:"
print_grid(board_b)
