class BoundingArea
  def initialize(box_array)
    @box_array = box_array
  end

  def boxes_contain_point?(x,y)
    bool = false

    @box_array.each do |box| 
      bool = true if box.contains_point?(x,y)  
    end
    
    return bool
  end

end
