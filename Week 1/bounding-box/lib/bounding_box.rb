class BoundingBox

  attr_reader :x, :y, :width, :height, :left, :right, :bottom, :top

  def initialize (x,y,width,height)
    @x = x
    @y = y 
    @width = width
    @height = height
    @left = @x
    @right = @x + @width
    @bottom = @y
    @top = @y + height
  end

  
  def contains_point? (ux,uy)

  ux >= @left && ux <= @right && 
  uy >= @bottom && uy <= @top ? true : false

  end

  
end
