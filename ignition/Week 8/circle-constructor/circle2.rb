class Circle
  def initialize(options_or_radius)
    if options_or_radius.kind_of?(Hash)
      @radius = options_or_radius[:radius] || (options_or_radius[:diameter] / 2)
    else
      @radius = options_or_radius
    end
  end
end