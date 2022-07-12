class Card
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  attr_accessor :rank, :suit
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

 def value
    RANKS.index(@rank) + 2
 end

end
