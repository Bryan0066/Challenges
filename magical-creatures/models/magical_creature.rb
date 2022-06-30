class MagicalCreature

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

    attr_reader :name, :magical_ability, :age, :ancient

    def initialize(name, magical_ability, age = nil)
        @name = name
        @magical_ability = magical_ability
        @age = age
        ancient = ancient?
    end

    def ancient?
        !@age || @age > 200 ?
    end

    def self.all
        creature_objects = []
        MAGICAL_CREATURES.each do |creature|
            creature_objects << MagicalCreature.new(creature[:name],creature[:ability],creature[:age])
          end
    end

end