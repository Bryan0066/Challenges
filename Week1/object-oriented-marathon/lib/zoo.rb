class Zoo

    attr_reader :cages, :add_employee, :employees, :season_closing_date, :season_opening_date

    def initialize(name, season_opening_date,season_closing_date)
        @name = name 
        @season_opening_date = season_opening_date
        @season_closing_date = season_closing_date
        @cages = create_cages
        @employees = []

    end

    def create_cages
        cages_array = []
        10.times{cages_array << Cage.new}
        cages_array
    end

    def add_employee(employee_object)
        @employees << employee_object
    end

    def open?(date)
        date >= season_opening_date && date <= season_closing_date
    end

    def add_animal(animal)
        cages.each do |cage|
            if cage.empty?
                cage.animal = animal
                return
            end
        end
        return "Your zoo is already at capacity!"
    end
    
    def visit
        greeting_array = ''
        @employees.each do |employee|
            greeting_array+= "#{employee.name} waved hello!\n"
        end
        @cages.each do |cage|
            if !cage.empty?
                greeting_array += "#{cage.animal.name}#{cage.animal.speak}\n"    
            end
        end
        
        greeting_array
    end
    

end