def greet(name, language = nil)
  case language
  when 'spanish'
    puts "Hola #{name}!"
  when 'italian'
    puts "Ciao #{name}!"
  when 'irken'
    puts "DOOM de doom #{name}!"
  else
    puts "Hi #{name}!"
  end
end

greet('Zoidberg', 'spanish')
