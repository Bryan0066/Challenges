require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "models/magical_creature.rb"

set :bind, '0.0.0.0'  # bind to all interfaces

# The MAGICAL_CREATURES variable is an array of hashes, and can be accessed from an of your routes.
MAGICAL_CREATURES = [
  {
    name: "unicorn",
    ability: "Its horn is said to have the power to render poisoned water potable and heal sickness.",
    age: 140
  },
  {
    name: "dragon",
    ability: "Breathes fire and has a hide of scales that is near impenetrable.",
    age: 587
  },
  {
    name: "phoenix",
    ability: "When it is old and weary, its body ignites in flame and it arises anew from the ashes of its predecessor.",
    age: nil
  }
]

# could use .map
# creature_objects = []

# MAGICAL_CREATURES.each do |creature|
#   creature_objects << MagicalCreature.new(creature[:name],creature[:ability],creature[:age])
# end

@creatures = MagicalCreature.all

get "/" do
  erb :home
end

get "/creatures" do
  @creature_objects = creature_objects
  erb :creatures
end

get "/creatures/:creature" do
  @creature = params["creature"]

  creature_objects.find do |creature|
    if creature.name == @creature
      @creature = creature
    end
  end
  
  erb :creature
end