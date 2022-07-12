class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def face_card?
    if @rank == "A" || @rank == "K" || @rank == "Q" || @rank == "J"
      true
    else
    false
   end

  end 


end
