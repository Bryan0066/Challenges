require "pry"

class Square

    attr_reader :x, :y, :length, :width

    def initialize(side, x = 0, y = 0)
        @side = side
        @x = x
        @y = y
        @length = side
        @width = side
    end

    def perimeter
        @side * 4
    end

    def diameter
        Math::sqrt(@side**2+@side**2)
    end

    def area
        @side**2
    end 

    def contains_point?(point_x, point_y)

        right_side  = @x.to_f + @side.to_f/2
        left_side   = @x.to_f - @side.to_f/2
        top_side    = @y.to_f + @side.to_f/2
        bottom_side = @y.to_f - @side.to_f/2

        point_x <= right_side && point_x >= left_side && point_y <= top_side && point_y >= bottom_side
        
        # binding.pry
    
    end
end
